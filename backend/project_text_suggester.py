from AVL import *

def suggest_avl(text):
    f = open('words.txt','r')
    nums = f.readlines()
    
    tree = avl()
    root = None
    for num in nums:
        root = tree.insert(root,num)
    
    s = tree.search(root,text,len(text))
    #print(s)
    return s
    
def spell_avl(text):
    f = open('words.txt','r')
    nums = f.readlines()
    root = None
    tree = avl()
    for num in nums:
        root = tree.insert(root,num)
    
    wrong = []
    text_list = text.split(" ")    
    for t in text_list:
        print(t)
        
        a = tree.spell_check(root, t+"\n")
        if a == False:
            wrong.append(t+"\n")
    
    tree.preorder(root)
    print(wrong)
    return wrong

def plagirism(text1,text2):
    final1 = text1.split(" ")
    final2 = text2.split(" ")
    root1 = None
    root2 = None
    tree1 = avl()
    #tree2 = avl()
    for i in final1:
        root1 = tree1.insert(root1,i)
        
    for i in final2:
        root2 = tree1.insert(root2,i)
    """
    s1 = tree1.plagirism(root1,[])
    s2 = tree2.plagirism(root2, [])
    c1 = tree1.count_node(root1,0)
    c2 = tree2.count_node(root2,0)
    print(c1,c2,s1,s2)
    tree1.preorder(root1)
    tree2.preorder(root2)
    avg = (c2+c1)//2
    #percent = (s/avg)*100
    tree1.preorder(root1)
    tree2.preorder(root2)
    #print("{0:.2f}".format(percent))
    """
    s1 = tree1.plagirism(root1,root2)
    c1 = tree1.count_node(root1,0)
    c2 = tree1.count_node(root2,0)
    print(c1,c2,s1)
    #tree1.preorder(root1)
    #tree1.preorder(root2)
    avg = (c2+c1)//2
    percent = (s1/avg)*100
    #tree1.preorder(root1)
    #tree1.preorder(root2)
    #print("{0:.2f}".format(percent))
    return "{0:.2f}".format(percent)
    
    
text1 = "hello"
text2 = "hello world I am anand"    
plagirism(text1, text2)
#spell_avl("ago agree against me advise")
#spell_avl("a good boy agree")

"""
f = open('words.txt','r')
nums = f.readlines()

tree = avl()
root = None
for num in nums:
    root = tree.insert(root,num)

n =input("Enter the word to be searched: ")

print("Suggested words are: ")
length = len(n)
s = tree.search(root,n,length)
if s == False:
    print("not found")
else:
    print(s.key)
    

print("\nThe word tree is: ")
tree.inorder(root)
"""