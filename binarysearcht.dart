//make a class for node

import 'dart:developer';

class Node {
  Node? left;
  Node? right;
  int value;
  Node(this.value);
}

//make a class for binary search tree
class Binarysearchtree {
  Node? root;
  void addroot(int value) {
    root = Node(value);
  }

  void insert(Node parent, int value) {
    if (value < parent.value) {
      if (parent.left == null) {
        parent.left = Node(value);
      } else {
        insert(parent.left!, value);
      }
    } else if (value > parent.value) {
      if (parent.right == null) {
        parent.right = Node(value);
      } else {
        insert(parent.right!, value);
      }
    } else {
      print("$value already exist in the tree ");
    }
  }

  //inorder
  void inorder(Node? parent) {
    if (parent == null) {
      return;
    }
    inorder(parent.left);
    print(parent.value);
    inorder(parent.right);
  }

  void postorder(Node? parent) {
    if (parent == null) {
      return;
    }
    postorder(parent.left);

    postorder(parent.right);
    print(parent.value);
  }

  void preorder(Node? parent) {
    if (parent == null) {
      return;
    }
    print(parent.value);
    preorder(parent.left);

    preorder(parent.right);
  }

  //find min node
  Node findMin(Node parent) {
    while (parent.left != null) {
      parent = parent.left!;
    }
    return parent;
  }

  //find max value
  Node findMax(Node parent) {
    while (parent.right != null) {
      parent = parent.right!;
    }
    return parent;
  }

  //delete a node
  Node? deleteNode(Node? parent, int value) {
    if (parent == null) {
      return null;
    }
    //it will move to the "if condtion" if the value is lesser or greater then the parent value other wise it will move to the else condition

    if (parent.value > value) {
      parent.left = deleteNode(parent.left, value);
    } else if (parent.value < value) {
      parent.right = deleteNode(parent.right, value);
    } else {
      //1:let suppose we want to delete 20 and it doesnt have any child , then we will apply this
      if (parent.left == null && parent.right == null) {
        return null;
      }
      //2:let suppose 20 has one child
      if (parent.left == null) return parent.right;
      if (parent.right == null) return parent.left;
      //3:let suppose 20 has two children
      Node temp = findMin(parent.right!);
      parent.value = temp.value;
      parent.right = deleteNode(parent.right, temp.value);
    }
    return parent;
  }

  //how to find height of the tree.
  int height(Node? parent) {
    if (parent == null) return 0;

    int leftresult = height(parent.left);
    int rightresult = height(parent.right);
    return 1 + (leftresult > rightresult ? leftresult : rightresult);
  }

  //now i will make function for search
  void search(Node? parent, int value) {
    if (parent == null) {
      return print("$value not found ");
    }
    if (parent.value == value) {
      return print("$value found in the tree");
    }
    if (parent.value > value) {
      search(parent.left, value);
    } else {
      search(parent.right, value);
    }
  }
}

//make  main class
void main() {
  Binarysearchtree tree = Binarysearchtree();
  //first make the root of the tree
  tree.addroot(50);

  tree.insert(tree.root!, 60);
  tree.insert(tree.root!, 40);
  tree.insert(tree.root!, 20);
  tree.insert(tree.root!, 30);
  tree.insert(tree.root!, 55);
  tree.insert(tree.root!, 33);
  print("Inorder Traversal:");
  tree.inorder(tree.root);
}
