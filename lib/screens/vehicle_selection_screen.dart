import 'package:flutter/material.dart';
import 'certificate_screen.dart'; // Sertifika ekranına geçiş yapılacak

// Araç seçim ekranı
class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Araçlar listesi (resim ve isimleri içeriyor)
    final vehicles = [
      {"image": "balon.png", "name": "Keşif Balonu"},
      {"image": "hali.png", "name": "Sihirli Halı"},
      {"image": "roket.png", "name": "Roket"},
      {"image": "ucak.png", "name": "Küçük Uçak"},
    ];

    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar'ın arkasında içerik yer alacak
      appBar: AppBar(
        leading: const BackButton(color: Colors.black), // Geri butonu
        title: const Text(
          "𝗔𝗿𝗮ç 𝗦𝗲ç𝗺𝗲", // Başlık
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // Başlık ortalanacak
        backgroundColor: Colors.transparent, // AppBar'ın arka planı şeffaf
        elevation: 0, // AppBar'ın gölgesini kaldır
        foregroundColor: Colors.black, // AppBar'daki ikonlar siyah olacak
        actions: const [
          SizedBox(width: 48), // Sağda boşluk bırakılacak
        ],
      ),
      body: Stack(
        // Arka planın üzerine widget'ları yerleştirmek için Stack kullanıyoruz
        children: [
          Positioned.fill(
            // Ekranı tamamen dolduran arka plan resmi
            child: Image.asset(
              "assets/animations/heroPage.jpg", // Arka plan görseli
              fit: BoxFit.cover, // Resmin ekranı kaplaması
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: kToolbarHeight + 32,
              ), // AppBar'ın altına boşluk ekledik
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Macera aracını seç!", // Seçim ekranı başlığı
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  // Araçları ızgara düzeninde listelemek için GridView kullanıyoruz
                  padding: const EdgeInsets.all(16),
                  itemCount:
                      vehicles.length, // Araç sayısına göre liste öğesi sayısı
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 sütun olacak
                    mainAxisSpacing: 16, // Ana eksende boşluk
                    crossAxisSpacing: 16, // Yatay eksende boşluk
                    childAspectRatio: 0.8, // Çocuk öğelerinin oranı
                  ),
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];

                    return GestureDetector(
                      // Her bir öğeye tıklanabilirlik ekliyoruz
                      onTap: () {
                        Navigator.push(
                          // Tıklanınca CertificateScreen'e yönlendir
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CertificateScreen(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // Kartların köşeleri yuvarlatıldı
                        ),
                        elevation: 6, // Kartın gölgesi
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/${vehicle["image"]}", // Araç resmini yükle
                                  fit:
                                      BoxFit
                                          .contain, // Resmi kartta uygun şekilde sığdır
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ), // Resim ile isim arasına boşluk
                              Text(
                                vehicle["name"]!, // Araç ismi
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center, // Metni ortala
                              ),
                            ],
                          ),
                        ),
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
