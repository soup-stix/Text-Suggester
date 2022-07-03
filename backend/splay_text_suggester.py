from SPLAY import *

def suggest_splay(text):
    f = open('words.txt','r')
    nums = f.readlines()
    
    a = SplayTree()
    
    for num in nums:
        a.insert(num)
    
    s = a.search(a.root,text,len(text))
    
    print(s)
    #a.inorder(a.root)
    return s

def spell_splay(text):
    f = open('words.txt','r')
    nums = f.readlines()
    
    a = SplayTree()
    
    for num in nums:
        a.insert(num)
    
    wrong = []
    text_list = text.split(" ")    
    for t in text_list:
        #print(a.root)
        #print(t)
        s = a.spell_check(a.root, t+"\n")
        #print(s)
        if s == None:
            wrong.append(t+"\n")
    
    print(wrong)
    #a.inorder(a.root)
    return wrong



suggest_splay("agr")
#spell_splay("a good boy agree")

