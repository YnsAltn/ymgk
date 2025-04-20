import 'package:flutter/material.dart';
import 'ar_preview_screen.dart'; // AR önizleme ekranına geçiş için gerekli olan ekran

// Sertifika ekranı - Stateless çünkü bu ekran sadece görsel ve metin içeriyor
class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar'ı arka planın üzerine yerleştir
      appBar: AppBar(
        leading: const BackButton(color: Colors.black), // Sol üstte geri butonu
        title: const Text(
          "𝐊𝐚ş𝐢𝐟 𝐒𝐞𝐫𝐭𝐢𝐟𝐢𝐤𝐚𝐬ı", // Sertifika başlığı
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Başlık rengi siyah
          ),
        ),
        centerTitle: true, // Başlık ortalanmış olacak
        backgroundColor: Colors.transparent, // AppBar şeffaf olacak
        elevation: 0, // AppBar'ın gölgesi kaldırıldı
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
          // İçerik kısmı
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0), // İçeriğin etrafında boşluk
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // İçeriği ortala
                children: [
                  // Kaşif tebrik yazısı
                  const Text(
                    "🎉 Tebrikler Kaşif! 🎉",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Yazı rengi siyah
                    ),
                    textAlign: TextAlign.center, // Yazı ortalanacak
                  ),
                  const SizedBox(height: 24), // Yazılar arasına boşluk
                  // Kaşif olmaya yaklaşan metin
                  const Text(
                    "Şimdi resmi bir *Kaşif* olmaya çok yaklaştın!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Yazı rengi siyah
                    ),
                    textAlign: TextAlign.center, // Yazı ortalanacak
                  ),
                  const SizedBox(height: 32), // Yazılar arasına büyük boşluk
                  // Kaşif yemini
                  const Text(
                    '"Keşfetmeyi, öğrenmeyi ve eğlenmeyi asla bırakmam!"',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic, // Yazı italik
                      color: Colors.black, // Yazı rengi siyah
                    ),
                    textAlign: TextAlign.center, // Yazı ortalanacak
                  ),
                  const SizedBox(height: 32), // Yazılar arasına boşluk
                  // Yemin etme butonu
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      backgroundColor: Colors.orange, // Buton rengi turuncu
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // Butonun köşe yuvarlak
                      ),
                      elevation: 5, // Butona hafif gölge ekle
                    ),
                    onPressed: () {
                      // Butona basıldığında AR önizleme ekranına geçiş yap
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ARPreviewScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Kabul Ettim ve Keşfe Hazırım!", // Buton yazısı
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Yazı rengi beyaz
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
