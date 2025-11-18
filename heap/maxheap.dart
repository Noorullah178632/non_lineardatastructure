class Maxheap {
  List<int> heap = [];
  List<int> array = [5, 77, 12, 34, 56, 66, 43, 16, 11];
  //make a iinsert function
  void insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  void heapifyUp(int index) {
    while (index > 0) {
      int parent = (index - 1) ~/ 2;
      //
      if (heap[index] > heap[parent]) {
        //the if condition mean if the actual value is greater then then parent value
        int temp = heap[index];
        heap[index] = heap[parent];
        heap[parent] = temp;

        index = parent;
      } else {
        break;
      }
    }
  }

  //function for delete
  void deleteMax() {
    if (heap.isEmpty) return null;
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    heapifyDown(0);
  }

  void heapifyDown(int index) {
    int leftchild, rightchild, largest;

    while (true) {
      leftchild = 2 * index + 1;
      rightchild = 2 * index + 2;
      largest = index;
      if (leftchild < heap.length && heap[leftchild] > heap[largest]) {
        largest = leftchild;
      }
      if (rightchild < heap.length && heap[rightchild] > heap[largest]) {
        largest = rightchild;
      }
      if (largest == index) break;
      int temp = heap[index];
      heap[index] = heap[largest];
      heap[largest] = temp;
      index = largest;
    }
  }

  //get max
  void getMax() {
    if (heap.isEmpty) {
      return print("heap is null");
    } else {
      int a = heap[0];
      print("Max Value of the heap is $a");
    }
  }

  // Build heap from any array
  void buildHeap(List<int> array) {
    heap = List.from(array); // copy array into heap
    int n = heap.length;
    for (int i = (n ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(i);
    }
  }

  // //heapify down for buildheap
  // void heapifyDownHeap(List array, int index, int n) {
  //   int largest = index;
  //   int left = 2 * index + 1;
  //   int right = 2 * index + 2;
  //   if (left < n && array[left] > array[largest]) {
  //     largest = left;
  //   }
  //   if (right < n && array[right] > array[largest]) {
  //     largest = right;
  //   }
  //   if (largest != index) {
  //     int temp = array[index];
  //     array[index] = array[largest];
  //     array[largest] = temp;
  //     heapifyDownHeap(array, largest, n);
  //   }
  // }

  //show the whole list of the max heap
  void showlist() {
    print(heap);
  }
}

void main() {
  Maxheap node = Maxheap();
  List<int> array = [5, 77, 12, 34, 56, 66, 43, 16, 11];
  node.insert(30);
  node.insert(40);
  node.insert(25);
  node.insert(50);
  node.showlist();
  node.deleteMax();
  node.showlist();
  node.buildHeap(array);
  print("Max Heap");
  node.showlist();
}
