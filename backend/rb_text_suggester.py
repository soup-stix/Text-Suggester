from RB import *

def suggest_rb(text):
    f = open('words.txt','r')
    nums = f.readlines()
    
    bst = RBTree()
    for num in nums:
        bst.insertNode(num)
    
    s = bst.search_tree(text,len(text))
    print(s)
    return s
    
def spell_rb(text):
    f = open('words.txt','r')
    nums = f.readlines()
    
    bst = RBTree()
    for num in nums:
        bst.insertNode(num)
        
    wrong = []
    text_list = text.split(" ")    
    for t in text_list:
        a = bst.spell_check(bst.root, t+'\n')
        if a.val == 0:
            wrong.append(t+"\n")
            
    print(wrong)
    return wrong
        
        


#suggest_rb('ag')
#spell_rb("a goood advice")