import 'dart:io';

int fibonacci(int n) {
  if (n == 0) {
    return 0; // Base case pertama
  } else if (n == 1) {
    return 1; // Base case kedua
  }
  return fibonacci(n - 1) + fibonacci(n - 2); // Recursive case
}

void main() {
  int jumlah = 10; // Ubah jumlah sesuai kebutuhan
  print('Deret Fibonacci:');
  for (int i = 0; i < jumlah; i++) {
    stdout.write('${fibonacci(i)} ');
  }
  print(''); // Pindah ke baris baru setelah mencetak semua angka
}
