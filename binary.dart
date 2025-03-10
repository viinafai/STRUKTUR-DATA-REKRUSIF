int binarySearchRecursive(List<int> arr, int left, int right, int target) {
  if (left > right) {
    return -1; // Target tidak ditemukan
  }

  int mid = left + (right - left) ~/ 2;

  if (arr[mid] == target) {
    return mid; // Target ditemukan pada indeks mid
  } else if (arr[mid] > target) {
    return binarySearchRecursive(arr, left, mid - 1, target); // Cari di kiri
  } else {
    return binarySearchRecursive(arr, mid + 1, right, target); // Cari di kanan
  }
}

void main() {
  List<int> data = [2, 5, 8, 10, 14, 32, 35, 41, 67, 88, 90, 101, 109];
  int target = 10;

  int result = binarySearchRecursive(data, 0, data.length - 1, target);

  if (result != -1) {
    print('Data $target berada pada indeks ke-$result');
  } else {
    print('Data $target tidak ditemukan');
  }
}
