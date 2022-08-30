# README
## このアプリできること
* ユーザー登録
* 心理テストの回答
* 回答結果の閲覧

## 開発言語
* Ruby 3.0.1
* Ruby on Rails 6.1.6

## 就業Termの技術
* Devise
* お気に入り機能（Ajax利用）

## カリキュラム外の技術
* gem rails_admin, gem cancancanを使った管理者機能
* gem ransackを利用した検索機能
* gem chartkickを利用したグラフ機能

## 実行手順
下記ターミナルで実行

```
$ git clone git@github.com:ymdarudy/psykarte.git
$ cd psykarte
$ bundle
$ rails db:create db:migrate
$ rails db:seed
$ rails r db/seeds/20220830.rb
$ rails s
```

## カタログ設計, テーブル設計
https://docs.google.com/spreadsheets/d/1TEDiH__0xlwXfDFIAFpcVRhMCDg2fTgPC1nBJ0EO8-s/edit#gid=782464957


## ワイヤーフレーム
draw.ioリンク
https://drive.google.com/file/d/1E69mS4ZEJyVlhp7KPDb22VjElnhK-jTK/view?usp=sharing
![ワイヤーフレーム](docs/wire-frame.png)

## ER図　
![ER図](docs/ER.png)


## 画面遷移図
draw.ioリンク
https://drive.google.com/file/d/18fVDwUAbLggvkVWvX5i9IAUPNkntpHV4/view?usp=sharing
![画面遷移図 ](docs/ui-flow.png)

## （管理者向け）心理テストの追加方法

1. seedデータファイルを作成し、db/seedsディレクトリに追加
（ファイル名はデータ作成日をもとに`yyyymmdd.rb`形式）
（記載方法は`20220830.rb`ファイルを参照）

2. CSVファイルが必要な場合は、作成後、db/csvディレクトリに格納

3. ターミナルコマンドで読み込み
`rails r db/seeds/yyyymmdd.rb`
※herokuの場合は
`heroku run rails r db/seeds/yyyymmdd.rb`


※管理者画面から、1件ずつ追加も可能ですが、
質問数が多いケースが多いので、上記を推奨いたします。
