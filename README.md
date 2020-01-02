<img width="1434" alt="スクリーンショット 2020-01-02 11 08 24" src="https://user-images.githubusercontent.com/50798936/71649294-ba08e480-2d50-11ea-81a6-ceac8be5925e.png">

## :globe_with_meridians:  App URL

### [文系学生と学ぶ社会学(web)](https://stormy-woodland-48686.herokuapp.com/)  
### [文系学生と学ぶ社会学(ios)](https://apps.apple.com/jp/app/%E6%97%A5%E6%9C%AC%E7%B5%B1%E8%A8%88-%E6%96%87%E7%B3%BB%E5%AD%A6%E7%94%9F%E3%81%A8%E5%AD%A6%E3%81%B6%E7%A4%BE%E4%BC%9A%E7%B5%B1%E8%A8%88%E5%AD%A6/id1491159876)

## :house:  開発環境
  
- Ruby
- RubyonRails
- Bootstrap
- jQuery
- VSCode (Visual Studio Code)
- Heroku
- Amazon S3

## :notebook:  アプリ機能

### 1.記事の作成

タイトルは40文字未満、内容は3000文字未満に設定してあります。  
写真の選択、タグの選択が可能です。  

<img width="1437" alt="スクリーンショット 2020-01-02 13 38 40" src="https://user-images.githubusercontent.com/50798936/71651984-402f2600-2d65-11ea-976c-e51fb27f140a.png">

### 2.記事の作成後にだけ現れる選択ページ

記事の作成後にだけ、「記事を確認」「過去記事一覧へ」「再編集する」の選択肢が現れるページに飛びます。  
「ブログが作成されました！」というflashも設定しました。  

<img width="1435" alt="スクリーンショット 2020-01-02 13 44 07" src="https://user-images.githubusercontent.com/50798936/71652090-25a97c80-2d66-11ea-9f64-9d142f08c842.png">

### ３.作成した記事を確認or再編集

別ウィンドウで作成した記事の確認ができます。  
AmazonS3を利用しているため、Herokuの本番環境でも画像を見ることが可能です。  
再編集を選択することも可能です。  

<img width="1436" alt="スクリーンショット 2020-01-02 13 48 51" src="https://user-images.githubusercontent.com/50798936/71652147-a5374b80-2d66-11ea-877c-f99225e39c4c.png">

### 4.コメントの書き込み

個々の記事に対してコメントを書き込めます。  

<img width="1433" alt="スクリーンショット 2020-01-02 14 07 52" src="https://user-images.githubusercontent.com/50798936/71652473-4a532380-2d69-11ea-869f-781a6b038d5c.png">

### 5.ログイン要求

記事の編集、削除、プロフィールの編集を選択した時、ユーザーがログインしていなければログインを要求します。  

<img width="1432" alt="スクリーンショット 2020-01-02 14 00 12" src="https://user-images.githubusercontent.com/50798936/71652353-3955e280-2d68-11ea-875f-1fe20cd91e08.png">

### 6.記事の管理

記事の編集、削除ができます。  
タグ別に記事を検索することも可能です。  

<img width="1432" alt="スクリーンショット 2020-01-02 14 12 09" src="https://user-images.githubusercontent.com/50798936/71652579-e8df8480-2d69-11ea-975b-2e5019a38ec2.png">

### 7.プロフィールの設定

jQueryで画像のプレビュー機能を実装しました。  

<img width="1432" alt="スクリーンショット 2020-01-02 14 14 56" src="https://user-images.githubusercontent.com/50798936/71652644-4c69b200-2d6a-11ea-9dfc-760b0cbe331b.png">

### 8.ブログの確認

タイトルをクリックすると個々のページに飛べます。  
5記事ごとにページを変えて表示します。

<img width="1425" alt="スクリーンショット 2020-01-02 14 19 37" src="https://user-images.githubusercontent.com/50798936/71652742-f21d2100-2d6a-11ea-8a9f-1648a7fb1242.png">

## :eyes:  Author

[Ruby on Rails チュートリアル](https://railstutorial.jp/)完了後、アレンジを加えてfc2ブログとほとんど同じ動きをするブログに改良。  
  
- [twitter](https://twitter.com/wafuwafu13_)
- [Qiita](https://qiita.com/wafuwafu13)
- [競ぷろぐ](https://kyoupurog.hatenablog.com/)
