import 'package:flutter/material.dart';
import 'equipment_selection_screen.dart'; // Bir sonraki ekran: ekipman seçimi

// Avatar seçimi ekranı - Stateless çünkü bu ekranda dinamik bir state yok
class AvatarSelectionScreen extends StatelessWidget {
  const AvatarSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Avatarların listesi (görsel yolu ve isimleri)
    final avatars = [
      {"image": "avatar1.png", "name": "Kaşif Aylin"},
      {"image": "avatar2.png", "name": "Kaşif Mert"},
      {"image": "avatar3.png", "name": "Kaşif Ahmet"},
    ];

    return Scaffold(
      extendBodyBehindAppBar:
          true, // AppBar'ı arka plan görselinin üzerine bindir
      appBar: AppBar(
        title: const Text(
          "【Ａｖａｔａｒ　Ｓｅçｉｍｉ】", // Stilize başlık
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Başlık rengi siyah
          ),
        ),
        centerTitle: true, // Başlık ortalanmış olsun
        backgroundColor: Colors.transparent, // AppBar arkaplanı şeffaf
        elevation: 0, // Gölgelendirme yok
        foregroundColor: Colors.black, // Geri butonu ve ikonlar siyah
      ),
      body: Stack(
        children: [
          // Arka plan görseli tüm ekranı kaplar
          Positioned.fill(
            child: Image.asset(
              "assets/animations/heroPage.jpg", // Arka plan görseli
              fit: BoxFit.cover, // Tüm alanı kaplayacak şekilde boyutlandır
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: kToolbarHeight + 32,
              ), // AppBar ile içerik arasına boşluk
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Avatarını seç!", // Ekran başlığı
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                // Grid şeklinde avatarları listeleyen yapı
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount:
                      avatars.length, // Kaç avatar varsa o kadar item oluştur
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 sütunlu grid
                    crossAxisSpacing: 10, // Sütunlar arası boşluk
                    mainAxisSpacing: 10, // Satırlar arası boşluk
                    childAspectRatio: 0.75, // Kartların oranı (büyüklüğü)
                  ),
                  itemBuilder: (context, index) {
                    final avatar =
                        avatars[index]; // Her bir avatar için veriler

                    return GestureDetector(
                      onTap: () {
                        // Avatar seçilince sonraki ekrana geç
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EquipmentSelectionScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          // Avatar görseli
                          Expanded(
                            flex: 7, // Görsele daha fazla alan ver
                            child: Image.asset(
                              "assets/images/${avatar["image"]}", // Avatar resmi
                              fit: BoxFit.contain, // Orantılı şekilde sığdır
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ), // Görsel ile isim arası boşluk
                          // Avatar ismi
                          Expanded(
                            flex: 2, // İsme daha az alan
                            child: Text(
                              avatar["name"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
