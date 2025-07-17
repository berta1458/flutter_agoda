import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildMainMenu(),
              const SizedBox(height: 20),
              _buildHorizontalFeatures(),
              const SizedBox(height: 20),
              _buildGiftSection(),
              const SizedBox(height: 20),
              _buildPromoSection(),
              const SizedBox(height: 20),
              _buildStatusSection(),
              const SizedBox(height: 20),
              _buildDestination(),
              // const SizedBox(height: 20),
              // _buildBottomNavBar(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/logo.png', height: 30),
          const SizedBox(width: 8),
          Image.asset('assets/vip.png', height: 20),
        ],
      ),
    );
  }

  Widget _buildMainMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _menuIcon('assets/agoda8.png'),
          const SizedBox(width: 0),
          _menuIcon('assets/agoda7.png'),
          const SizedBox(width: 0),
          _menuIcon('assets/agoda6.png'),
          const SizedBox(width: 0),
          _menuIcon('assets/agoda5.png'),
        ],
      ),
    );
  }

  Widget _menuIcon(String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, height: 64, width: 64, fit: BoxFit.cover),
      ],
    );
  }

  Widget _buildHorizontalFeatures() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _featureIcon(FontAwesomeIcons.planeDeparture, 'Kombo\nAgoda'),
            _featureIcon(FontAwesomeIcons.calendarDays, 'Menginap\nLama'),
            _featureIcon(FontAwesomeIcons.clock, 'Per jam'),
            _featureIcon(FontAwesomeIcons.tags, 'Special\nOffers'),
            _featureIcon(FontAwesomeIcons.car, 'Sewa\nmobil'),
          ],
        ),
      ),
    );
  }

  Widget _featureIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, color: Colors.blue, size: 24),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGiftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1,
          color: Colors.grey.shade300,
          width: double.infinity,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hadiah buat pengguna baru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _giftCard(
                      icon: FontAwesomeIcons.ticket,
                      title: 'Diskon hingga 12%',
                      subtitle: 'Pemesanan hotel pertama',
                      buttonText: 'Klaim',
                    ),
                    const SizedBox(width: 12),
                    _giftCard(
                      imagePath: 'assets/agoda2.png',
                      title: 'Uji Coba',
                      subtitle: 'Diskon hingga 10%',
                      buttonText: 'Klaim',
                    ),
                    const SizedBox(width: 12),
                    _giftCard(
                      icon: FontAwesomeIcons.plane,
                      title: 'Diskon hingga 8%',
                      subtitle: 'Pesanan Penerbangan',
                      buttonText: 'Klaim',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 1,
          color: Colors.grey.shade300,
          width: double.infinity,
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _giftCard({
    IconData? icon,
    String? imagePath,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Row(
        children: [
          if (imagePath != null)
            Image.asset(imagePath, width: 36, height: 36)
          else if (icon != null)
            FaIcon(icon, size: 20, color: Color(0xFF756318)),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Text(buttonText, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Promo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Row(
            children: [
              _promoTab(text: 'Semua', isActive: false),
              const SizedBox(width: 8),

              _promoTab(
                text: 'Hotel',
                isActive: true,
                icon: FontAwesomeIcons.hotel,
              ),
              const SizedBox(width: 8),

              _promoTab(
                text: 'Aktivitas',
                isActive: false,
                icon: FontAwesomeIcons.solidSun,
              ),
            ],
          ),
          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _promoCard(imagePath: 'assets/image1.png'),
                const SizedBox(width: 12),
                _promoCard(imagePath: 'assets/image3.png'),
                const SizedBox(width: 12),
                _promoCard(imagePath: 'assets/image2.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _promoTab({
    required String text,
    bool isActive = false,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE8ECFF) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isActive ? Colors.blue : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            FaIcon(
              icon,
              size: 14,
              color: isActive ? Colors.blue : Colors.black,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _promoCard({required String imagePath}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(imagePath, width: 300, height: 160, fit: BoxFit.cover),

          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFFFDFDF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Icon(
                FontAwesomeIcons.hotel,
                size: 16,
                color: Color(0xFFEF363F),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1,
          color: Colors.grey.shade300,
          width: double.infinity,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Status VIP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 12),
              _statusCard(
                subtitle:
                    'Sebagai Agoda VIP Bronze, Anda berhak mendapat diskon lebih!',
                imagePath: 'assets/vip.png',
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.shade300,
          width: double.infinity,
        ),
      ],
    );
  }

  Widget _statusCard({required String subtitle, required String imagePath}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(subtitle, style: const TextStyle(fontSize: 14))],
            ),
          ),

          const SizedBox(width: 12),
          Image.asset(imagePath, width: 90, height: 32),
        ],
      ),
    );
  }

  Widget _buildDestination() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Temukan hotel di destinasi populer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _destinationCard(
                  imagePath: 'assets/des1.png',
                  title: 'Malang',
                  subtitle: 'Alam | Restoran',
                  price: 'Rp 322.208 rata-rata per malam',
                ),
                const SizedBox(width: 12),
                _destinationCard(
                  imagePath: 'assets/des2.jpg',
                  title: 'Yogyakarta',
                  subtitle: 'Kebudayaan | Culture',
                  price: 'Rp 324.496 rata-rata per malam',
                ),
                const SizedBox(width: 12),
                _destinationCard(
                  imagePath: 'assets/des3.jpg',
                  title: 'Bali',
                  subtitle: 'Alam | Kebudayaan',
                  price: 'Rp 400.208 rata-rata per malam',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _destinationCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: 500,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
        return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.briefcase),
          label: 'Trip Saya',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.tags),
          label: 'Promo',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.cartShopping),
          label: 'Troli',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: 'Lainnya',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue, 
      unselectedItemColor: Colors.grey, 
      showUnselectedLabels: true, 
      showSelectedLabels: true, 
      mouseCursor: SystemMouseCursors.basic, 
      onTap: (index) {
      },
      ),
    );
  }
}
