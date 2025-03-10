int faktorial(int n) {
  if (n == 0 || n == 1) {
    return 1; // Base case
  }
  return n * faktorial(n - 1); // Recursive case
}

void main() {
  int angka = 5; // Ubah angka sesuai kebutuhan
  print('Faktorial dari \$angka adalah: ${faktorial(angka)}');
}
