// ignore_for_file: deprecated_member_use

import 'package:coffeapp/core/controllers/riverpod_management.dart';
import 'package:coffeapp/core/database/KahveModel.dart';
import 'package:coffeapp/core/models/siparis_model.dart';
import 'package:coffeapp/views/sepet/sepet_drawer_menu.dart';
//import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KahveDetaySayfa extends ConsumerWidget {
  final Kahve? kahve;
  final int? kahveId;
  const KahveDetaySayfa({Key? key, this.kahve, this.kahveId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    var read = ref.read(kahveDetayProvider);
    var sepetRead = ref.read(sepetProvider);
    var watch = ref.watch(kahveDetayProvider);

    return Scaffold(
      backgroundColor: kahve!.bgcolor,
      endDrawer: const SepetWidget(),
      appBar: AppBar(
        backgroundColor: kahve!.bgcolor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Sipariş Detayı',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height,
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.250),
                        height: 500.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
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
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            '${kahve!.isim}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 20.0),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Fiyat\n',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'GilamSemiBold',
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${kahve!.fiyat} ₺',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  '${kahve!.resim}',
                                  width: 200.0,
                                  //fit: BoxFit.cover,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.325),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              top: 10.0,
                              right: 10.0,
                            ),
                            child: Text(
                              '${kahve!.aciklama}',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45.0,
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: read.sizes.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: read.sizes.length,
                              ),
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    read.setSeciliBoy(index);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: watch.seciliBoy == index
                                              ? const Color(0xFFFF990D)
                                              : Colors.grey.shade300,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            read.sizes[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: watch.seciliBoy == index
                                                  ? Colors.white
                                                  : const Color(0xFF27251F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Özelleştirme',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kaç Adet Kahve:',
                                  //'${kahve!.isim} sayısı',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        read.unsetSiparisSayisi();
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(
                                            Icons.remove,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        watch.siparisSayisi
                                            .toString()
                                            .padRight(2, 'x'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        read.setSiparisSayisi();
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Şeker Paket Sayısı:',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: SizedBox(
                                      width: 160.0,
                                      height: 60.0,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              top: 0.0,
                                              right: 10.0,
                                              bottom: 0.0),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                        onChanged: (String? item) {
                                          read.setSeciliDropdown1(item!);
                                        },
                                        value: watch.seciliDropdown1,
                                        items: read.dropdown1.map(
                                          (String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 20.0),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Krema Pompaları:',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: SizedBox(
                                      width: 160.0,
                                      height: 60.0,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              top: 0.0,
                                              right: 10.0,
                                              bottom: 0.0),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                        onChanged: (String? item) {
                                          read.setSeciliDropdown2(item!);
                                        },
                                        value: watch.seciliDropdown2,
                                        items: read.dropdown2.map(
                                          (String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 20.0),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Krem Şanti Pompaları:',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: SizedBox(
                                      width: 160.0,
                                      height: 60.0,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              top: 0.0,
                                              right: 10.0,
                                              bottom: 0.0),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                        onChanged: (String? item) {
                                          read.setSeciliDropdown3(item!);
                                        },
                                        value: watch.seciliDropdown3,
                                        items: read.dropdown3.map(
                                          (String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 20.0),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          /* 
            var uuid = const Uuid();
            var uid = uuid.v4(); 
          */
          if (watch.seciliBoy == 0) {
            read.setSeciliBoyString("Küçük Boy");
          } else if (watch.seciliBoy == 1) {
            read.setSeciliBoyString("Orta Boy");
          } else if (watch.seciliBoy == 2) {
            read.setSeciliBoyString("Büyük Boy");
          }

          SiparisModel modelData = SiparisModel(
            id: kahveId,
            isim: kahve!.isim!,
            fiyat: kahve!.fiyat! * watch.siparisSayisi,
            boy: watch.seciliBoyString,
            sekerSayisi: watch.seciliDropdown1,
            kremaPompaSayisi: watch.seciliDropdown2,
            kremaSantiPompaSayisi: watch.seciliDropdown3,
            siparisSayisi: watch.siparisSayisi,
          );

          sepetRead.sepeteEkle(modelData);
        },
        style: ElevatedButton.styleFrom(
          primary: kahve!.bgcolor,
          side: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: SizedBox(
          width: 220.0,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.coffee, color: Colors.white),
              const SizedBox(width: 10.0),
              Text(
                'Sepete Ekle (${(kahve!.fiyat! * watch.siparisSayisi).toStringAsFixed(2)}₺)',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
