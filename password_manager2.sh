#!/bin/bash

echo 'パスワードマネージャーへようこそ！'
echo '次の選択肢から入力してください(Add Password/Get Password/Exit)：' 

while read choices;
do
    case $choices in

        # Add Password が入力された場合
        'Add Password')
            echo 'サービス名を入力してください：'
            read service_name

            echo 'ユーザー名を入力してください：'
            read user_name

            echo 'パスワードを入力してください：'
            read passwd

            echo 'パスワードの追加は成功しました。'

            echo '[出力結果]' $service_name:$user_name:$passwd

            # password_manager.txtファイルにサービス名：ユーザ名：パスワード名を転記する
            echo $service_name:$user_name:$passwd >> password_manager1.txt 

            echo '次の選択肢から入力してください(Add Password/Get Password/Exit)：' ;;

        'Get Password')
            # Get Password が入力された場合
            echo 'サービス名を入力してください：'
            read service_name

            # ファイルを読み取り、サービス名を探す
            if grep -w "$service_name" password_manager1.txt ; then
                #　サービス名が保存されていた場合
                echo 'サービス名：' $service_name
                echo 'ユーザー名：' $user_name
                echo 'パスワード：' $passwd 

            else
                # サービス名が保存されていなかった場合
                echo 'そのサービスは登録されていません。'
                
            fi
                echo '次の選択肢から入力してください(Add Password/Get Password/Exit)：';;
        

        'Exit') 
            # Exit が入力された場合、プログラムが終了
            echo 'Thank you!' 
            exit;;

        *)
        # Add Password/Get Password/Exit 以外が入力された場合  
        echo '入力が間違えています。Add Password/Get Password/Exit から入力してください。';;
    esac

done


#4/14処理を実行した後、条件分岐に戻らない
#case文にwhileを含ませた。
#それぞれの場合の最後にread choicesが入っていたため繰り返し処理にならなかった：解決

#choice[Get Password]時のファイルへ検索して文字列を出力する方法
#未解決
