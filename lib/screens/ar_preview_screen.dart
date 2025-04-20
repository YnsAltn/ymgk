import 'dart:async'; // Zamanlayıcı (Timer, Future.delayed) gibi işlemler için
import 'package:camera/camera.dart'; // Kamera kullanımı için
import 'package:flutter/material.dart'; // Flutter'ın temel UI bileşenleri

// AR (Artırılmış Gerçeklik) ekranını temsil eden Stateful widget
class ARPreviewScreen extends StatefulWidget {
  const ARPreviewScreen({super.key});

  @override
  State<ARPreviewScreen> createState() => _ARPreviewScreenState();
}

class _ARPreviewScreenState extends State<ARPreviewScreen> {
  CameraController? controller; // Kamera kontrolcüsü
  bool _showWelcome = true; // "Hoşgeldin" mesajını göstermek için flag

  @override
  void initState() {
    super.initState();
    _initCamera(); // Ekran başlarken kamerayı başlat
  }

  // Kamerayı başlatan metod
  Future<void> _initCamera() async {
    final cameras = await availableCameras(); // Cihazdaki mevcut kameraları al
    final rear = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back, // Arka kamerayı seç
    );
    controller = CameraController(
      rear,
      ResolutionPreset.high,
    ); // Kamera kontrolcüsünü başlat
    await controller?.initialize(); // Kamerayı başlat

    // Kamera hazırsa ekranı yeniden oluştur
    if (mounted) {
      setState(() {});

      // 3 saniye sonra "Hoşgeldin" yazısını gizle
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _showWelcome = false;
          });
        }
      });
    }
  }

  // Sayfa kapatıldığında kamerayı durdur
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // UI oluşturuluyor
  @override
  Widget build(BuildContext context) {
    // Eğer kamera hazır değilse, yükleniyor göstergesi çıkar
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Kamera hazırsa ekranı oluştur
    return Scaffold(
      body: Stack(
        children: [
          // Kamera görüntüsünü tam ekran göster
          Positioned.fill(child: CameraPreview(controller!)),

          // Ekranın ortasında gösterilecek AR öğesi (örneğin: halı resmi)
          Center(
            child: Image.asset(
              'assets/images/hali.png', // Görsel yolu
              width: 300, // Genişlik
            ),
          ),

          // İlk 3 saniye boyunca gösterilecek hoşgeldin mesajı
          if (_showWelcome)
            Center(
              child: Container(
                padding: const EdgeInsets.all(12), // İç boşluk
                color: Colors.black54, // Arka plan yarı saydam siyah
                child: const Text(
                  "Hoşgeldin Kaşif!", // Hoşgeldin mesajı
                  style: TextStyle(
                    fontSize: 28, // Yazı boyutu
                    color: Colors.white, // Yazı rengi
                    fontWeight: FontWeight.bold, // Kalın yazı
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
