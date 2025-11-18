class Maxheap {
  List<int> heap = [];
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

  //show the whole list of the max heap
  void showlist() {
    print(heap);
  }
}

void main() {
  Maxheap node = Maxheap();
  node.insert(30);
  node.insert(40);
  node.insert(25);
  node.insert(50);
  node.showlist();
  node.deleteMax();
  node.showlist();
}
