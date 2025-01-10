import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isActivityActive = true;

  final List<Map<String, String>> activityNotifications = [
    {
      "title": "SALE 50%",
      "description": "Check the details on your favorite items!",
      "time": "2 hours ago",
      "image": "assets/images/produk1.png",
    },
    {
      "title": "Order Shipped",
      "description": "Your order #12345 has been shipped. Track it now!",
      "time": "3 days ago",
      "image": '',
    },
    {
      "title": "New Feature Update",
      "description":
          "We have introduced a seller dashboard for better tracking.",
      "time": "Yesterday",
      "image": '',
    },
  ];

  final List<Map<String, String>> sellerNotifications = [
    {
      "title": "You Got New Order!",
      "description": "Please arrange delivery",
      "time": "Just now",
      "image": 'assets/images/produk3.png',
    },
    {
      "title": "You Got New Order!",
      "description": "Please arrange delivery",
      "time": "Just now",
      "image": 'assets/images/produk8.png',
    },
    {
      "title": "You Got New Order!",
      "description": "Please arrange delivery",
      "time": "Just now",
      "image": 'assets/images/produk6.png',
    },
    {
      "title": "You Got New Order!",
      "description": "Please arrange delivery",
      "time": "Just now",
      "image": 'assets/images/produk10.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan tombol kembali dan judul
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                const Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Switch antara "Activity" dan "Seller Mode"
            Center(
              child: Container(
                width: 240,
                height: 45,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    // Tombol "Activity"
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isActivityActive = true),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActivityActive
                                ? const Color(0xFF7140FC)
                                : const Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              'Activity',
                              style: TextStyle(
                                color: isActivityActive
                                    ? Colors.white
                                    : const Color(0xFFB3B1B0),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Tombol "Seller Mode"
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isActivityActive = false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActivityActive
                                ? const Color(0xFFF7F7F7)
                                : const Color(0xFF7140FC),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              'Seller Mode',
                              style: TextStyle(
                                color: isActivityActive
                                    ? const Color(0xFFB3B1B0)
                                    : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tampilan berdasarkan mode
            isActivityActive
                ? Expanded(
                    child: ListView.builder(
                      itemCount: activityNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = activityNotifications[index];
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(notification["title"] ?? ""),
                                content:
                                    Text(notification["description"] ?? ""),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Close"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: NotificationTile(notification: notification),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: sellerNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = sellerNotifications[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman detail ketika item diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetailPage(
                                  notification: notification,
                                ),
                              ),
                            );
                          },
                          child: NotificationTile(notification: notification),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key, required this.notification})
      : super(key: key);

  final Map<String, String> notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (notification["image"] != null &&
              notification["image"]!.isNotEmpty)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(notification["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD9D9D9),
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 24,
              ),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification["title"] ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification["description"] ?? "",
                  style: const TextStyle(
                    color: Color(0xFFB3B1B0),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            notification["time"] ?? "",
            style: const TextStyle(
              color: Color(0xFFB3B1B0),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Detail Pesanan
class OrderDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  const OrderDetailPage({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 46,
              child: Stack(
                children: [
                  Positioned(
                    left: 140,
                    top: 20,
                    child: Text(
                      'Order',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.47,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: [
                          BoxShadow(
                            color: const Color(0x11000000),
                            blurRadius: 20,
                            offset: const Offset(4, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Container(
                width: 218,
                height: 228,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Stack(
                  children: [
                    // Gambar pertama
                    Positioned(
                      left: 12,
                      top: 0,
                      child: Container(
                        width: 144,
                        height: 221,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/produk3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Gambar kedua
                    Positioned(
                      left: 84,
                      top: 50,
                      child: Container(
                        width: 116,
                        height: 178,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/produk3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Alamat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.80,
              ),
            ),
            Text(
              'Abdul Dudul',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.60,
              ),
            ),
            Text(
              '081225649746',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color(0xFFB3B1B0),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.60,
              ),
            ),
            SizedBox(
              width: 327,
              child: Text(
                'Jl. Siliwangi Jl. Ringroad Barat, Area Sawah,\nBanyuraden, Kec. Gamping, Kabupaten Sleman, \nDaerah Istimewa Yogyakarta 55293',
                style: TextStyle(
                  color: Color(0xFFB3B1B0),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.60,
                ),
              ),
            ),
            Container(
              width: 330,
              height: 4,
              decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
            Text(
              'Detail Produk',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.80,
              ),
            ),
            Container(
              width: 278,
              height: 47,
              child: Stack(
                children: [
                  Positioned(
                    left: 62,
                    top: 1.96,
                    child: Container(
                      width: 216,
                      height: 43.08,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 138,
                              height: 20.56,
                              child: Text(
                                'FC Persia',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 24.48,
                            child: SizedBox(
                              width: 216,
                              height: 18.60,
                              child: Text(
                                '3 x Rp 42.000',
                                style: TextStyle(
                                  color: Color(0xFFB3B1B0),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.60,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 48,
                      height: 47,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 48,
                              height: 47,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 2.94,
                            child: Container(
                              width: 30,
                              height: 41.12,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/produk3.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Container(
              width: 330,
              height: 4,
              decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
            Text(
              'Rincian Pembayaran',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.80,
              ),
            ),
            Container(
              width: 345,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: 271,
                    top: 29,
                    child: SizedBox(
                      width: 70,
                      child: Text(
                        'Rp 126.000\n   Rp 5.000',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFFB3B1B0),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 270,
                    top: 81,
                    child: SizedBox(
                      width: 70,
                      child: Text(
                        'Rp 131.000',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 81,
                    child: SizedBox(
                      width: 327,
                      child: Text(
                        'Total Belanja',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 29,
                    child: SizedBox(
                      width: 327,
                      child: Text(
                        'Subtotal Harga Barang\nTotal Ongkos Kirim',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFFB3B1B0),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 341,
                      height: 22,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 341,
                              child: Text(
                                'Metode Pembayaran',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFFB3B1B0),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.60,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 310,
                            top: 0,
                            child: SizedBox(
                              width: 70,
                              child: Text(
                                'BRI',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFFB3B1B0),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.60,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 21,
                            child: Container(
                              width: 333,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFB3B1B0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 76,
                    child: Container(
                      width: 333,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFB3B1B0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 332,
              height: 29,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      'Bukti Pembayaran',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.80,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 280,
                    top: 5,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Bukti Pembayaran'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Berikut adalah bukti pembayaran Anda:'),
                                  SizedBox(height: 10),
                                  Image.asset('assets/images/Receipt.png'),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tutup'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'View File',
                        style: TextStyle(
                          color: Color(0xFF7140FC),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 47,
              child: Stack(
                children: [
                  // Tombol Terima Pesanan
                  Positioned(
                    left: 60,
                    top: 0,
                    child: Container(
                      width: 260,
                      height: 47,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      decoration: ShapeDecoration(
                        color: Color(0xFF7140FC),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0x7FD9D9D9)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 66),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Pesanan Berhasil Diterima'),
                                  content: Text(
                                      'Pesanan Anda berhasil diterima dan siap diproses.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Terima Pesanan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 5,
                    top: 5,
                    child: GestureDetector(
                      onTap: () {
                        // Menampilkan alert ketika chat icon ditekan
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Chat'),
                              content:
                                  Text('Anda baru saja mengklik ikon chat!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 37,
                        height: 37,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.black,
                          size: 20,
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
    );
  }
}
