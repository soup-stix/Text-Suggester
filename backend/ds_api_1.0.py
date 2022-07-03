
from optparse import check_choice
from flask import Flask, jsonify, request
import json
from psycopg2 import Error
from datetime import date, datetime
from project_text_suggester import *
from splay_text_suggester import *
from rb_text_suggester import *
from btree_text_suggester import *

app = Flask(__name__)

@app.route('/words',methods=['POST'])
def suggest_words():
    #storing received data into a variable
    request_data = request.data

    #decoding json data
    request_data = json.loads(request_data.decode('utf-8'))

    #generating suggestions for the input text
    text = request_data['text']
    text_list = text.split(" ")
    print(text_list[-1])

    final_avl = suggest_avl(text_list[-1])
    print(final_avl)

    final_splay = suggest_splay(text_list[-1])
    print(final_splay)

    final_rb = suggest_rb(text_list[-1])
    print(final_rb)

    final_btree = suggest_btree(text_list[-1])
    print(final_btree)

    #attaching words
    request_data['words_avl'] = final_avl
    request_data['words_splay'] = final_splay
    request_data['words_rb'] = final_rb
    request_data['words_btree'] = final_btree

    return jsonify(request_data)

@app.route('/spells',methods=['POST'])
def spell_check():
    #storing received data into a variable
    request_data = request.data

    #decoding json data
    request_data = json.loads(request_data.decode('utf-8'))

    #generating spell check for the input text
    text = request_data['text']

    final_avl = spell_avl(text)
    print(final_avl)

    final_splay = spell_splay(text)
    print(final_splay)

    final_rb = spell_rb(text)
    print(final_rb)

    final_btree = spell_btree(text)
    print(final_btree)

    #attaching words
    request_data['spells_avl'] = final_avl
    request_data['spells_splay'] = final_splay
    request_data['spells_rb'] = final_rb
    request_data['spells_btree'] = final_btree

    return jsonify(request_data)

@app.route('/plagirism',methods=['POST'])
def plagirism_check():
    #storing received data into a variable
    request_data = request.data

    #decoding json data
    request_data = json.loads(request_data.decode('utf-8'))

    #generating spell check for the input text
    text1 = request_data['text1']
    text2 = request_data['text2']

    temp = plagirism(text1,text2)
    print(temp)
    #attaching words
    request_data['percent'] = temp 

    return jsonify(request_data)

if __name__ == '__main__':
    app.run(debug = True)