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
  print("InorderTraversal:");
  tree.inorderTraversal(tree.root);
  print("PostorderTraversal:");
  tree.postorderTraversal(tree.root);
  print("preordreTraversal:");
  tree.preorderTraversal(tree.root);
}
//note : the inner left and right  will decide that where to go and the outer will decide where to place 