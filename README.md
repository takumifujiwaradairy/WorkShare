# README



# WorkShare

#Ngrokの環境構築
インストール方法
$ brew install ngrok/ngrok/ngrok
アカウント作成と紐付け
※ここは、省いても２時間までは無料で使える。それ以降は再度実行しなければならない。
https://dashboard.ngrok.com/
$ ./ngrok authtoken トークン名
サーバーの実行
$./ngrok http 3000
