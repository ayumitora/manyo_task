# 万葉新人研修課題

Rails 5.2.3

https://nameless-anchorage-10334.herokuapp.com/

# テーブル

Userテーブル

|Column|Type|Description|
|:---|:---|:---|
|user_name|string||
|email|string|index|
|passwdigest|string|


Taskテーブル

|Column|Type|Description|
|:---|:---|:---|
|task_name|string||
|deadline|datetime|
|priority|integer|
|status|string|
|note|text|
|user_id|bigint|foreign_key
|label_id|bigint|foreign_key|

Labelテーブル

|Column|Type|Description|
|:---|:---|:---|
|label_name|string||
|task_id|bigint|foreign_key


#　デプロイ方法

$ heroku login
herokuにログイン

$ heroku create
新しいリポジトリを作る
自動でリモートリポジトリとして登録される

$ git push heroku master
pushする

$ heroku run rails db:migrate
heroku上にデータベース作成

https://nameless-anchorage-10334.herokuapp.com/
アクセスして確認

※設定などはこちらから
https://dashboard.heroku.com/apps

