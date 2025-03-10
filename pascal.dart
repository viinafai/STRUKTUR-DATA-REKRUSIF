import 'dart:io';

// Fungsi rekursif untuk menghitung elemen pada Segitiga Pascal
int pascal(int n, int k) {
  if (k == 0 || k == n) {
    return 1;
  } else {
    return pascal(n - 1, k - 1) + pascal(n - 1, k);
  }
}

// Fungsi untuk mencetak Segitiga Pascal dengan format sama kaki
void printPascalsTriangle(int rows) {
  for (int i = 0; i < rows; i++) {
    // Menambahkan spasi untuk membuat segitiga sama kaki
    for (int j = 0; j < rows - i - 1; j++) {
      stdout.write(' ');
    }

    // Mencetak elemen-elemen segitiga Pascal pada baris ke-i
    for (int j = 0; j <= i; j++) {
      stdout.write('${pascal(i, j)} ');
    }

    // Pindah ke baris berikutnya
    print('');
  }
}

void main() {
  // Meminta input jumlah baris segitiga Pascal
  print('Masukkan jumlah baris segitiga Pascal: ');
  int rows = int.parse(stdin.readLineSync()!);

  // Mencetak Segitiga Pascal
  printPascalsTriangle(rows);
}
