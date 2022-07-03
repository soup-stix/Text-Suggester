from BTREE import *

def suggest_btree(text):
    
    B = BTree(12)
    f = open('words.txt','r')
    nums = f.readlines()
    for num in nums:
        B.insert([num])
    
    s = B.search_key(text,len(text),[],B.root)

    #print(s)
    return s
    

def spell_btree(text):
    B = BTree(12)
    f = open('words.txt','r')
    nums = f.readlines()
    for num in nums:
        B.insert([num])
   
    res=[]
    res2=[]
    r=0
    
    testwrd=text.split()
    for i in testwrd:
        res.append(i+"\n")
    for i in testwrd:
        B.splcheck(i+"\n",res,B.root)
        t=0
    print(res)
    return res

#suggest_btree('ad')
#spell_btree("a goood advice")
