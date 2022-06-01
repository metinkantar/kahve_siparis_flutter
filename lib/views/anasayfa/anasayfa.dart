// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeapp/views/sepet/sepet_drawer_menu.dart';
import 'package:coffeapp/core/database/KahveModel.dart';
import 'package:coffeapp/views/anasayfa/kahve_detay.dart';
import 'package:coffeapp/views/hesabim/giris.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffeapp/core/controllers/riverpod_management.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance;
    var read = ref.read(anasayfaProvider);
    var watch = ref.read(anasayfaProvider);
    final theme = Theme.of(context);

    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    PageController pageController = PageController(
      initialPage: read.pageRoute,
      keepPage: true,
    );

    return user.currentUser == null
        ? const GirisSayfasi()
        : SafeArea(
            child: Scaffold(
              key: scaffoldKey,
              endDrawer: const SepetWidget(),
              backgroundColor: theme.backgroundColor,
              
              appBar: AppBar(
                backgroundColor: theme.backgroundColor,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.transparent),
                  onPressed: () {},
                ),
                leadingWidth: 20.0,
                centerTitle: true,
                elevation: 0.7,
                title: Text(
                  'Kahve Dünyası',
                  style: TextStyle(
                    color: Colors.black87.withOpacity(0.7),
                    fontFamily: 'CodeNextBold',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.basketShopping,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  /* IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.receipt,
                      color: Colors.black,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/siparislerim'),
                  ), 
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      girisPrvdr.cikis(context);
                    },
                  ),*/
                ],
              ),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.125,
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: ListView.builder(
                          controller: watch.scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: read.categoryList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (pageController.hasClients) {
                                  pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.bounceIn,
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8.0, right:0, bottom: 4.0),
                                child: Container(
                                  height: size.height * 0.150,
                                  decoration: BoxDecoration(
                                    color: theme.backgroundColor,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          read.categoryList[index]["image"],
                                          height: 50,
                                        ),
                                        Text(
                                          read.categoryList[index]["title"],
                                          style: const TextStyle(
                                            fontFamily: "OpenSansRegular",
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12.5,
                                            color: Colors.black87,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          ListView.builder(
                            itemCount: kahveListesi.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KahveDetaySayfa(
                                      kahveId: index,
                                      kahve: kahveListesi[index],
                                    ),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                  '${kahveListesi[index].resim}',
                                ),
                              ),
                              title: Text(
                                '${kahveListesi[index].isim}',
                                style: const TextStyle(
                                  fontFamily: "GilamBold",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black87,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              subtitle: Text(
                                '${kahveListesi[index].fiyat} ₺',
                                style: TextStyle(
                                  fontFamily: "GilamSemiBold",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.red.shade800,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              trailing: Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          const Center(
                            child: Text('Soğuk Kahveler'),
                          ),
                          const Center(
                            child: Text('Sıcak Çaylar'),
                          ),
                          const Center(
                            child: Text('Sıcak İçecekler'),
                          ),
                          const Center(
                            child: Text('Buzlu Çaylar'),
                          ),
                          const Center(
                            child: Text('Özel'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class KahveDetay extends StatefulWidget {
  final Kahve? kahve;
  const KahveDetay({Key? key, this.kahve}) : super(key: key);

  @override
  State<KahveDetay> createState() => _KahveDetayState();
}

class _KahveDetayState extends State<KahveDetay> {
  List<String> sizes = ['Küçük Boy', 'Orta Boy', 'Büyük Boy'];
  var uuid = const Uuid();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var dropdownValue1 = '0';
    var dropdownValue2 = '0';
    var dropdownValue3 = '0';
    Size size = MediaQuery.of(context).size;
    int seciliBoy = 1;
    int siparisSayisi = 1;
    CollectionReference siparisRef = firestore.collection("siparisler");

    return Scaffold(
      backgroundColor: widget.kahve!.bgcolor,
      appBar: AppBar(
        backgroundColor: widget.kahve!.bgcolor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Sipariş Hazırlama'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: 20.0,
                      right: 20.0,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('${widget.kahve!.aciklama}...'),
                        const SizedBox(height: 10.0),
                        Container(
                          height: 90.0,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: sizes.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: sizes.length,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  seciliBoy = index;
                                });
                                print('tıklandı $index');
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20.0, 15.0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15.0),
                                      width: 95.0,
                                      decoration: BoxDecoration(
                                        color: seciliBoy == index
                                            ? const Color(0xFFE1E4E8)
                                            : Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        border: const Border(
                                          top: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFE1E4E8),
                                          ),
                                          bottom: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFE1E4E8),
                                          ),
                                          left: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFE1E4E8),
                                          ),
                                          right: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFE1E4E8),
                                          ),
                                        ),
                                      ),
                                      child: Wrap(
                                        children: [
                                          Text(
                                            sizes[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: seciliBoy == index
                                                  ? Colors.black
                                                  : const Color(0xFF27251F),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('${widget.kahve!.isim} sayısı'),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: OutlinedButton(
                                    child: const Icon(
                                        Icons.do_not_disturb_on_outlined),
                                    onPressed: () {
                                      setState(() {
                                        if (siparisSayisi < 9) {
                                          setState(() {
                                            siparisSayisi--;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    siparisSayisi.toString().padRight(2, 'x'),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: OutlinedButton(
                                    child: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        if (siparisSayisi < 9) {
                                          setState(() {
                                            siparisSayisi++;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Özelleştirme',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Şeker Paket Sayısı:'),
                            DropdownButton<String>(
                              value: dropdownValue1,
                              icon: Icon(
                                Icons.arrow_downward,
                                color: dropdownValue1 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              iconSize: 20.0,
                              elevation: 16,
                              style: TextStyle(
                                color: dropdownValue1 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              underline: Container(
                                height: 2.0,
                                color: dropdownValue1 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                });
                              },
                              items: <String>[
                                '0',
                                '1',
                                '2(+ .25c)',
                                '3(+ .50c)',
                                '4(+ .75c)',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Krema Pompaları:'),
                            DropdownButton<String>(
                              value: dropdownValue2,
                              icon: Icon(
                                Icons.arrow_downward,
                                color: dropdownValue2 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              iconSize: 20.0,
                              elevation: 16,
                              style: TextStyle(
                                color: dropdownValue2 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              underline: Container(
                                height: 2.0,
                                color: dropdownValue2 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              items: <String>[
                                '0',
                                '1',
                                '2(+ .25c)',
                                '3(+ .50c)',
                                '4(+ .75c)',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Krem Şanti Pompaları:'),
                            DropdownButton<String>(
                              value: dropdownValue3,
                              icon: Icon(
                                Icons.arrow_downward,
                                color: dropdownValue3 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              iconSize: 20.0,
                              elevation: 16,
                              style: TextStyle(
                                color: dropdownValue3 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              underline: Container(
                                height: 2.0,
                                color: dropdownValue3 != '0'
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue3 = newValue!;
                                });
                              },
                              items: <String>[
                                '0',
                                '1',
                                '2(+ .25c)',
                                '3(+ .50c)',
                                '4(+ .75c)',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sıcak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '${widget.kahve!.isim}',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                  ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Fiyat\n',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 18.0,
                                      fontFamily: 'GilamSemiBold',
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.kahve!.fiyat} ₺',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Hero(
                                  tag: '${widget.kahve!.id}',
                                  child: Image.asset(
                                    '${widget.kahve!.resim}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 65.0),
          ],
        ),
      ), //Body(kahve: kahve),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var id = uuid.v1();
          Map<String, dynamic> siparisData = {
            'isim': widget.kahve!.isim,
            'boy': seciliBoy,
            'siparis_sayisi': siparisSayisi,
            'seker_sayisi': int.parse(dropdownValue1),
            'krema_pompa_sayisi': int.parse(dropdownValue2),
            'krema_santi_pompa_sayisi': int.parse(dropdownValue3),
            'fiyat': widget.kahve!.fiyat,
          };
          siparisRef.doc(id).set(siparisData);
          Navigator.pop(context);
          print("sipariş verildi");
        },
        label: Text('Sipariş Ver (${widget.kahve!.fiyat})'),
        icon: const FaIcon(FontAwesomeIcons.coffee),
        backgroundColor: widget.kahve!.bgcolor,
      ),
    );
  }
}
