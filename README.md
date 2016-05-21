#DB設計書

____________________________________________________

## create tables
* users  
* comments  
* prototypes(メイン)  
* thumbnails  
* likes  

_____________________________________________________



## users table  

### association  
* user has_many prototypes, comments  


### column

* id integer型  
* name string型  
* email string型  
* encrypted_password string型  
* profile text型  
* topmedia string型  
* work text型  
* member string  
* avater string  



## comments table  

### assiciation  
* comment belongs_to prototype, user

### column  
* id integer型　
* user_id integer型  
* article_id integer型  
* text text型  

## prototypes table  

### association  
* prototypes has_many thumbnails, comments, likes  
* prototypes belongs_to user  

### column  
* id integer型  
* title string型  
* catchcopy text型  
* concept text型  

## thumbnails table  

### association  
* thumbnails belongs_to prodtotype  

### column  
* id integer型  
* article_id integer型  
* image_url text型  

## likes table  

### association  
* like belongs_to prototype

### column  
* id integer型  

________________________________________________________

## カラムのデータ型その他

* timestamps型  

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
