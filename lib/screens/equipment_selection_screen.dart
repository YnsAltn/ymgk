import 'package:flutter/material.dart';
import 'vehicle_selection_screen.dart'; // Araç seçim ekranına yönlendirme

// Ekipman seçimi ekranı - Stateless çünkü sadece görsel ve metin içeriyor
class EquipmentSelectionScreen extends StatelessWidget {
  const EquipmentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ekipmanların listesi
    final items = [
      {"image": "pusula.png", "name": "Pusula"}, // Ekipmanlar ve resim adları
      {"image": "fotograf.png", "name": "Fotoğraf Makinesi"},
      {"image": "notdefteri.png", "name": "Not Defteri"},
    ];

    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar'ı arka planın üzerine yerleştir
      appBar: AppBar(
        leading: const BackButton(color: Colors.black), // Sol üstte geri butonu
        title: const Text(
          "𝐄𝐤𝐢𝐩𝐦𝐚𝐧 𝐒𝐞ç𝐦𝐞", // Ekran başlığı
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Başlık rengi siyah
          ),
        ),
        centerTitle: true, // Başlık ortalanmış olacak
        backgroundColor: Colors.transparent, // AppBar şeffaf olacak
        elevation: 0, // AppBar'ın gölgesi kaldırıldı
        foregroundColor: Colors.black, // AppBar ikonu siyah
        actions: const [
          SizedBox(
            width: 48,
          ), // Sağ tarafta boşluk bırakıldı (başlığı ortalamak için)
        ],
      ),

      body: Stack(
        children: [
          // Arka plan görseli
          Positioned.fill(
            child: Image.asset(
              "assets/animations/heroPage.jpg", // Arka planda kullanılacak görsel
              fit:
                  BoxFit.cover, // Görseli ekranı kaplayacak şekilde ölçeklendir
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: kToolbarHeight + 32,
              ), // AppBar'dan sonra boşluk
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Keşif ekipmanlarını seç!", // Ekipman seçme çağrısı
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Yazı rengi siyah
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length, // Ekipman sayısı kadar öğe oluştur
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      elevation: 6, // Kartın gölgesi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // Yuvarlak köşeler
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 12,
                      ), // Kartlar arasına boşluk
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(
                          16,
                        ), // Kartın iç boşluğu
                        leading: Image.asset(
                          "assets/icons/${item["image"]}", // Ekipmanın resmini göster
                          width: 60, // Resmin genişliği
                          height: 60, // Resmin yüksekliği
                        ),
                        title: Text(
                          item["name"]!, // Ekipmanın adı
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Yazı rengi siyah
                          ),
                        ),
                        onTap: () {
                          // Ekipman seçildiğinde, araç seçim ekranına geçiş yapılır
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const VehicleSelectionScreen(),
                            ),
                          );
                        },
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
