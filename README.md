# README

Userテーブル

|Column|Type|Description|
|:---|:---|:---|
|user_name|string||
|password|string|


Taskテーブル

|Column|Type|Description|
|:---|:---|:---|
|task_name|string||
|dedline|datetime|
|pliority|integer|
|status|string|
|note|text|
|user_id|bigint|foreigen_key
|lavel_id|bigint|foreigen_key|

Lavelテーブル

|Column|Type|Description|
|:---|:---|:---|
|lavel_name|string||
|task_id|bigint|foreigen_key