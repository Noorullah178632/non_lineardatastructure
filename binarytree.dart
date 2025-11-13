//make class for Node
class Node {
  var value;
  Node? left;
  Node? right;
  Node(this.value);
}

class Binarytree {
  Node? root;
  //make a function for root
  void addRoot(int value) {
    root = Node(value);
  }

  //make a function to add value in the left side of the parent node
  void leftchild(Node parent, int value) {
    if (parent != null) {
      parent.left = Node(value);
    } else {
      print("There is no such type of parent node $parent");
    }
  }

  //make search funtion
  Node? search(Node? root, int value) {
    if (root == null) return null;
    if (root.value == value) {
      print("value Found :");
      return root.value;
    }
    Node? leftSearch = search(root.left, value);
    if (leftSearch != null) return leftSearch;
    return search(root.right, value);
  }

  //find the height of the tree.
  int height(Node? root) {
    if (root == null) return 0;
    int leftresult = height(root.left);
    int rightresult = height(root.right);
    return 1 + (leftresult > rightresult ? leftresult : rightresult);
  }

  //count the nodes of the function
  int countNode(Node? root) {
    if (root == null) return 0;
    return 1 + countNode(root.left) + countNode(root.right);
  }

  // ✅ Function to check if a node is leaf
  bool isLeaf(Node node) {
    return node.left == null && node.right == null;
  }

  // ✅ Function to check if given value is a leaf node
  bool? isLeafNode(Node? root, int value) {
    Node? foundNode = search(root, value);
    if (foundNode == null) {
      print("Value not found in tree");
      return null;
    }
    return isLeaf(foundNode);
  }

  //make a functionto add value in the right side of the parent node
  void rightchild(Node parent, int value) {
    if (parent != null) {
      parent.right = Node(value);
    } else {
      print("There is no such type of parent Node $parent");
    }
  }

  void inorderTraversal(Node? root) {
    if (root == null) return; // stop silently if no node
    inorderTraversal(root.left);
    print(root.value);
    inorderTraversal(root.right);
  }

  void preorderTraversal(Node? root) {
    if (root == null) return;
    print(root.value);
    preorderTraversal(root.left);
    preorderTraversal(root.right);
  }

  void postorderTraversal(Node? root) {
    if (root == null) return;
    postorderTraversal(root.left);
    postorderTraversal(root.right);
    print(root.value);
  }
}

void main() {
  Binarytree tree = Binarytree();
  //first we have to make the root
  tree.addRoot(40);
  tree.leftchild(tree.root!, 23);
  tree.rightchild(tree.root!, 24);

  tree.leftchild(tree.root!.left!, 12);
  tree.rightchild(tree.root!.left!, 33);

  tree.rightchild(tree.root!.right!, 00);
  //this node will overrite the previous node :00
  tree.leftchild(tree.root!.right!, 11);
  // tree.leftchild(tree.root!.left!, 3);
  // print("InorderTraversal:");
  // tree.inorderTraversal(tree.root);
  // print("PostorderTraversal:");
  // tree.postorderTraversal(tree.root);
  // print("preordreTraversal:");
  // tree.preorderTraversal(tree.root);
  print(tree.search(tree.root, 11));

  print(tree.height(tree.root));

  print(tree.countNode(tree.root));
}
//note : the inner left and right  will decide that where to go and the outer will decide where to place 
//level order traversal 