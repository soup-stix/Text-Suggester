#AVL
class Node_avl:
    def __init__(self,value):
        self.key = value
        self.left = None
        self.right = None
        self.height = 1

class avl:
    def __init__(self):
        self.cnt = 0
        self.word_list = []
        self.plg_cnt = 0
        self.tot_cnt = 0
        
    def insert(self,root,key):
        if not root:
            return Node_avl(key)
        elif key < root.key:
            root.left = self.insert(root.left, key)
        else:
            root.right = self.insert(root.right, key)
            
        root.height = 1 + max(self.height(root.left),self.height(root.right))
        
        balancefactor = self.balance(root)
        if balancefactor > 1:
            if key < root.left.key:
                return self.rrotate(root)
            else:
                root.left = self.lrotate(root.left)
                return self.rrotate(root)
            
        if balancefactor < -1:
            if key < root.right.key:
                return self.lrotate(root)
            else:
                root.right = self.rrotate(root.right)
                return self.lrotate(root)
            
        return root
    
    def delete_node(self, root, key):
        if not root:
            return root
        elif key < root.key:
            root.left = self.delete_node(root.left, key)
        elif key > root.key:
            root.right = self.delete_node(root.right, key)
        else:
            if root.left is None:
                temp = root.right
                root = None
                return temp
            elif root.right is None:
                temp = root.left
                root = None
                return temp
            temp = self.getMinValueNode(root.right)
            root.key = temp.key
            root.right = self.delete_node(root.right,
                                          temp.key)
        if root is None:
            return root
        
    def getMinValueNode(self, root):
        if root is None or root.left is None:
            return root
        return self.getMinValueNode(root.left)
        
    def height(self,root):
        if root == None:
            return 0
        return root.height
    
    def rrotate(self,x):
        y = x.left
        temp = y.right
        y.right = x
        x.left = temp
        x.height = 1 + max(self.height(x.left),self.height(x.right))
        y.height = 1 + max(self.height(y.left),self.height(y.right))
        return y
    
    def lrotate(self,x):
        y = x.right
        temp = y.left
        y.left = x
        x.right = temp
        x.height = 1 + max(self.height(x.left),self.height(x.right))
        y.height = 1 + max(self.height(y.left),self.height(y.right))
        return y
    
    def preorder(self,root):
        if not root:
            return 
        print(root.key,end = " ")
        self.preorder(root.left)
        self.preorder(root.right)
    
    def postorder(self,root):
        if not root:
            return
        self.postorder(root.left)
        self.postorder(root.right)
        print(root.key,end = " ")
        
    def count_node(self,root,temp):
        if not root:
            return temp
        temp = temp + 1
        temp = self.count_node(root.left,temp)
        temp = self.count_node(root.right, temp)
        
        return temp
        
    
    def plagirism(self,root1,root2):
        if not root1 or  not root2:
            return self.plg_cnt
        #print(root1.key,root2.key)
        if root1.key == root2.key:
            self.plg_cnt = self.plg_cnt + 1
        self.plagirism(root1.left,root2.left)
        self.plagirism(root1.right,root2.right)
        
        return self.plg_cnt
    """
    def plagirism(self,root,temp):
        if not root:
            return temp
        self.plagirism(root.left,temp)
        temp.append(root.key)
        self.plagirism(root.right,temp)
        
        return temp
    """
        
    def inorder(self,root):
        if not root:
            return 
        self.inorder(root.left)
        print(root.key,end = " ")
        self.inorder(root.right)
    
    def balance(self,root):
        if not root:
            return 0
        return self.balance(root.left) - self.balance(root.right)
    
    def search(self,root,key,length):
        if root == None:
            return False
        #print(root.key)
        if self.cnt >= 5:
            return False
        if root.key[:length] == key:
            self.cnt = self.cnt + 1
            #print(root.key)
            self.word_list.append(root.key)
            self.search(root.right,key,length)
            self.search(root.left,key,length)
        if root.key[:length]  < key:
            return self.search(root.right,key,length)
        if root.key[:length] > key:
            return self.search(root.left,key,length)
        
        return self.word_list
    
    def spell_check(self,root,key):
        if root == None:
            return False
        if root.key == key:
            return root
        if root.key < key:
            return self.spell_check(root.right,key)
        if root.key > key:
            return self.spell_check(root.left,key)
            
        
    
        

        
"""
head = avl()

root = None

nums = [33,12,52,9,21,8]

for num in nums:
    root = head.insert(root, num)
   
print("Preorder: ")
head.preorder(root)
print("\n")
print("Postorder: ")
head.postorder(root)
print("\n")
print("Inorder: ")
head.inorder(root)

   
tree = avl()
root = None
nums = ['assignment','asian','an']
for num in nums:
    root = tree.insert(root,num)
    
tree.inorder(root)
"""