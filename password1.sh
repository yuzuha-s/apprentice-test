#!/bin/bash

echo 'パスワードマネージャーへようこそ！'

echo 'サービス名を入力してください：'
read service_name

echo 'ユーザー名を入力してください：'
read user_name

echo 'パスワードを入力してください：'
read passwd

echo '[出力結果]' $service_name:$user_name:$passwd

echo $service_name:$user_name:$passwd >> password_manager.txt

echo 'Thank you!'