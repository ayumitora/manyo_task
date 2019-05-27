# README

branch:step5

Userテーブル

|Column|Type|Description|
|:---|:---|:---|
|user_name|string||
|email|string|index|
|password|string|


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