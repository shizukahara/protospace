== README

This README would normally document whatever steps are necessary to get the
application up and running.

#DB設計書


## モデル間のアソシエーション
*articles(1)に対してimages(他) articles has_many images, images belongs_to article 以下はそれぞれを簡略化して説明

* article has_many images, comments.  
* article belongs_to user,  
* image belongs_to article  
* comment belongs_to tweet, user  
* user has_many articles, comments  

____________________________________________________

## 作成するテーブル
* users  
* comments  
* articles(メイン)  
* images  

_____________________________________________________

## テーブルにおけるカラム

### usersテーブルについて
* id  
* name  
* email  
* encrypted_password  

### commentsテーブルについて
* id  
* user_id  
* article_id  
* text  

###articlesテーブルについて
* id  
* title  
* catchcopy  
* concept  

###imagesテーブルについて
* id  
* article_id  
* image_url  

________________________________________________________

## カラムのデータ型
* id系一般 integer型  
* name string型  
* title string型  
* catchcopy text型  
* concept text型  
* email string型  
* encrypted_password string型  
* timestamps型  

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
