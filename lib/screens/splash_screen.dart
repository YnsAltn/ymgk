import 'package:flutter/material.dart';
import 'avatar_selection_screen.dart'; // Avatar seçim ekranına geçiş yapılacak

// SplashScreen ekranı, uygulama açıldığında gösterilen başlangıç ekranı
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Animasyon kontrolü için SingleTickerProviderStateMixin kullanılıyor
  late AnimationController _controller; // Animasyon kontrolörü

  @override
  void initState() {
    super.initState();

    // Animasyon kontrolörünü başlatma, 2 saniyelik bir animasyon süresi belirliyoruz
    _controller = AnimationController(
      vsync: this, // Animasyonun düzgün çalışması için vsync
      duration: const Duration(seconds: 2), // 2 saniye sürecek
    )..forward(); // Animasyonu başlatıyoruz

    // 3 saniye sonra Avatar seçim ekranına geçiş yapılıyor
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AvatarSelectionScreen(),
        ), // Avatar seçim ekranına yönlendir
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100, // Ekranın arka plan rengi
      body: Center(
        child: FadeTransition(
          // Animasyonlu geçiş için FadeTransition widget'ı kullanıyoruz
          opacity:
              _controller, // Animasyon kontrolörü ile opaklık değeri belirleniyor
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Çocuk widget'ları dikeyde ortala
            children: [
              Image.asset(
                'assets/animations/logo.png',
                width: 200,
              ), // Uygulama logosu
              const SizedBox(height: 20), // Logo ve yazı arasında boşluk
              const Text(
                "Kaşif Akademisi", // Başlık
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ), // Başlık stilini ayarla
              ),
            ],
          ),
        ),
      ),
    );
  }
}
