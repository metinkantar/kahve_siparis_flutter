import 'package:coffeapp/core/controllers/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SepetWidget extends ConsumerWidget {
  const SepetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(sepetProvider);
    var watch = ref.watch(sepetProvider);
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text(
                        'Sepetim',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ...watch.sepet
                          .map(
                            (item) => Card(
                              elevation: 2,
                              child: ListTile(
                                leading: Text("${item.siparisSayisi}"),
                                title: Text('${item.isim}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${item.boy}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),),
                                    Text(
                                      '${(item.fiyat! * item.siparisSayisi).toStringAsFixed(2)} TL',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => read.sepettenCikar(item),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
            watch.toplamFiyat == 0.0
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Sipariş Toplam: ",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${watch.toplamFiyat.toStringAsFixed(2)} TL',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 10.0,
                right: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () => read.sepetiTemizle(),
                child: const Center(
                  child: Text(
                    'Sepeti Temizle',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () => read.sepetiTemizle(),
                child: const Center(
                  child: Text(
                    'Siparişi Tamamla',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
