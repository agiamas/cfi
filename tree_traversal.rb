#1 preorder root comes first and then left and right subtree, inorder root in the middle, postorder root comes last. When implementing
# them, we need to think about what kind of traversal we want to achieve, what is our problem. Secondary to that, we need to think
# if we can afford recursion. For this question I will assume that the stack can fit our calls.


#2,3
class TreeTraversal
  @lcFound = false
  @rcFound = false

  def preOrder node
    if (node==nil) then
      return 0
    end;
    print "\n current node value(preorder):" + node.getValue.to_s
    treetr = TreeTraversal.new
    treetr.preOrder node.getLeftChild
    treetr.preOrder node.getRightChild

  end

  def inOrder node
    if (node==nil) then
      return 0
    end;
    treetr = TreeTraversal.new
    treetr.inOrder node.getLeftChild
    print "\n current node value(inorder):" + node.getValue.to_s
    treetr.inOrder node.getRightChild
  end

  def postOrder node
    if (node==nil) then
      return 0
    end;
    treetr = TreeTraversal.new
    treetr.postOrder node.getLeftChild
    treetr.postOrder node.getRightChild
    print "\n current node value(postorder):" + node.getValue.to_s
  end

  def findCommonAncestorPostOrder node1, node2, root
    if(@lcFound=true && @rcFound=true) then print("found common ancestor post order " + root.getValue.to_s) end
    if (root==nil) then
      return 0
    end;
    if(root==node1) then @lcFound=true end
    if(root==node2) then @rcFound=true end
    treetr = TreeTraversal.new
    treetr.postOrder root.getLeftChild
    treetr.postOrder root.getRightChild
    print "\n current node value(postorder):" + root.getValue.to_s
  end

  def findCommonAncestor (node1, node2, root)
  @commonAncestor
  while(node1!=root)
      while(node2!=root)
           node1 = node1.getParent()
           node2 = node2.getParent()
           if(node1==node2) then @commonAncestor=node1 end
           puts "\n common ancestor value:" + @commonAncestor.getValue().to_s
      end
    end
  end
end


class TreeNode
  @value = 0;
  @leftChild;
  @rightChild;
  @parent;

  def getParent
    return @parent
  end

  def setParent par
    @parent = par
  end

  def getValue
    return @value;
  end

  def setValue val
    @value = val
  end

  def getLeftChild
    return @leftChild
  end

  def setLeftChild leftCh
    @leftChild = leftCh
  end

  def getRightChild
    return @rightChild
  end

  def setRightChild rightCh
    @rightChild = rightCh
  end
end

leftChild = TreeNode.new
leftChild.setValue(2)
rightChild = TreeNode.new
rightChild.setValue(3)

@tnroot = TreeNode.new
@tnroot.setValue(1)
@tnroot.setLeftChild(leftChild)
@tnroot.setRightChild(rightChild)

leftChild.setParent @tnroot
rightChild.setParent @tnroot

# print out values to verify that we setup our tree correctly
print @tnroot.getValue
print leftChild.getValue
print rightChild.getValue

# actual tree traversal
#preorder
treeTr = TreeTraversal.new
treeTr.preOrder @tnroot

#inorder
treeTrIn = TreeTraversal.new
treeTrIn.inOrder @tnroot

#postorder
treeTrPost = TreeTraversal.new
treeTrPost.postOrder @tnroot


#find common ancestor
treeAnc = TreeTraversal.new
treeAnc.findCommonAncestor leftChild, rightChild, @tnroot

#find common ancestor without parent node
root = TreeNode.new
lc = TreeNode.new
rc = TreeNode.new
lgc = TreeNode.new
root.setLeftChild lc
root.setRightChild rc
root.setValue 1
lc.setValue 2
rc.setValue 3
lc.setLeftChild lgc
lgc.setValue 4
 treeAnc.findCommonAncestorPostOrder lc, rc, root

