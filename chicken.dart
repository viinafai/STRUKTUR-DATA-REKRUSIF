import 'dart:io';

// Fungsi untuk memformat angka menjadi format rupiah
String formatRupiah(double number) {
  return 'Rp. ' +
      number
          .toStringAsFixed(2)
          .replaceAllMapped(
            RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
            (Match match) => '${match[1]}.',
          );
}

void main() {
  // Daftar menu ayam
  List<Map<String, dynamic>> menu = [
    {'kode': 'D', 'jenis': 'Dada', 'harga': 2500.0},
    {'kode': 'P', 'jenis': 'Paha', 'harga': 2000.0},
    {'kode': 'S', 'jenis': 'Sayap', 'harga': 1500.0},
  ];

  List<Map<String, dynamic>> pesanan = [];

  // Tampilan menu
  print('GEROBAK FRIED CHICKEN');
  print('--------------------------------');
  print('Kode  Jenis  Harga');
  menu.forEach((item) {
    print(
      '${item['kode']}     ${item['jenis']}   ${formatRupiah(item['harga'])}',
    );
  });
  print('--------------------------------');

  // Input jumlah jenis ayam
  stdout.write('Banyak Jenis: ');
  int banyakJenis = int.parse(stdin.readLineSync()!);

  // Proses input pesanan
  for (int i = 1; i <= banyakJenis; i++) {
    print('\nJenis ke-$i');
    stdout.write('Jenis Potong [D/P/S]: ');
    String kode = stdin.readLineSync()!.toUpperCase();

    var item = menu.firstWhere((m) => m['kode'] == kode, orElse: () => {});

    if (item.isNotEmpty) {
      stdout.write('Banyak Potong: ');
      int banyakPotong = int.parse(stdin.readLineSync()!);

      pesanan.add({
        'jenis': item['jenis'],
        'harga': item['harga'],
        'banyak': banyakPotong,
        'total': item['harga'] * banyakPotong,
      });
    } else {
      print('Kode tidak valid!');
    }
  }

  // Menampilkan nota
  print('\nGEROBAK FRIED CHICKEN');
  print('-----------------------------------------------------------------');
  print('No.  Jenis Potong  Harga Satuan  Banyak Beli  Jumlah Harga');
  print('-----------------------------------------------------------------');

  double jumlahBayar = 0;
  for (int i = 0; i < pesanan.length; i++) {
    var p = pesanan[i];
    print(
      '${(i + 1).toString().padRight(4)} ${p['jenis'].padRight(13)} ${formatRupiah(p['harga']).padRight(18)} ${p['banyak'].toString().padRight(7)} ${formatRupiah(p['total'])}',
    );
    jumlahBayar += p['total'];
  }

  double pajak = jumlahBayar * 0.10;
  double totalBayar = jumlahBayar + pajak;

  // Mengatur teks agar sejajar dengan kolom "Jumlah Harga"
  String spasi = ' ' * 32;
  print('-----------------------------------------------------------------');
  print('${spasi}Jumlah Bayar  ${formatRupiah(jumlahBayar)}');
  print('${spasi}Pajak 10%     ${formatRupiah(pajak)}');
  print('${spasi}Total Bayar   ${formatRupiah(totalBayar)}');
}
