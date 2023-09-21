# アプリケーション名
Aleitu.Doyal（アレイツ・ドーヤル）
# アプリケーション概要
「あれ、やったのいつだっけ？」<br>
「あれ、次はいつやればいいんだっけ？」<br>
「あれ、どうやるんだったっけ？」<br>
そんな「あれはいつ？どうやるの？」を解決する、リマインダー＆情報交換アプリケーションです。<br>

登録したリマインダーに、ユーザーから投稿された記事（色々な事のやり方をメモした投稿＝「Doyal（ドーヤル＝どうやる？）」と呼んでいます）を関連付ける事で、手順の情報を持ったリマインダーを作ることができます。

主な機能は以下の通りです。
* リマインダー作成、更新
* 記事作成、更新
* リマインダーと記事の関連付け
# URL
https://aleitu-doyal.onrender.com
# テスト用アカウント
### ユーザー1
mail : test1@test.com<br>
pass : 111111
### ユーザー2
mail : test2@test.com<br>
pass : 222222
# 利用方法
サイトにアクセスすると、投稿されたDoyalの一覧ページが表示されます。<br>
未ログインの状態ではDoyalの詳細・ユーザーの詳細ページの表示のみ行えます。<br>
サイドバーからログインをすることで、当日までに予定されているリマインダーの一覧（トップページ）が表示され、その他の機能が利用できるようになります。
## リマインダーの登録
1. サイドバーからリマインダー登録画面へアクセスします。
2. タイトル・リマインドの頻度・初回のリマインド予定日を入力し、登録ボタンをクリックする。
## リマインダーの完了・スキップ
1. リマインダーの一覧・詳細画面へアクセスします。
2. 「finish!」ボタンをクリックすると、実施履歴と実施予定日が更新されます。
3. 「skip」ボタンをクリックすると、実施予定日のみが更新されます。
4. 誤ってフラグを立ててしまった場合は、リマインダーの詳細画面から編集機能を利用して修正することができます。
## Doyalの新規投稿
1. サイドバーからDoyalの新規投稿ページへアクセスします。
2. 記事のタイトル・公開の可否を入力し、「Doyal memo作成へ進む」ボタンをクリックします。
3. 画像や説明文（画像のみ、説明文のみでも可）を入力し、「Doyal memoを追加する」ボタンをクリックします。
4. 本文の追加が完了したら、「記事詳細ページへ戻る」ボタンをクリックします。
5. 上記で作成した記事本文は、記事詳細ページから編集・削除を行えます。
## リマインダーとDoyalの関連付け
1. リマインダーの詳細ページへアクセスします。
2. ページ下部の「Doyalとの関連付けページへ移動」ボタンをクリックします。
3. 関連付けを行うDoyalを選択し、「関連付けるDoyalを決定する」ボタンをクリックします。
4. Doyalの詳細ページからも、同様の手順でリマインダーへの関連付けを行うことができます。
# アプリケーションを作成した背景
浴室のカビ取り剤の使用、バイクのチェーンの清掃、キッチンの換気扇の分解、車のオイル交換など…定期的に行う必要があるものの、前回実施したのはいつで、次はいつやるべきかといったことを手軽に記録・計画するためのリマインダーアプリを妻も私も欲していました。（＝Aleitu・アレイツ）<br>
また、普段自分が行わない事や、たまにしか行わない事については、取り掛かる前にやり方を検索をすることも多いと思います。<br>
そこで、リマインダー機能だけではなく手順を記録する機能も備えました。（＝Doyal・ドーヤル）<br>
作成した手順は公開して、ユーザー同士で情報交換を行える場も設けています。
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1McREI74N2XKN0p3ukczWveXjhy9VAI8qFQ3ZrCLYaTM/edit?usp=sharing
# 実装した機能についての画像やGIF及びその説明
* リマインダー一覧画面
[![Image from Gyazo](https://i.gyazo.com/97d9d527d565e1125a61966908068598.png)](https://gyazo.com/97d9d527d565e1125a61966908068598)

* Doyal本文（Doyal memo）の作成画面
[![Image from Gyazo](https://i.gyazo.com/99a890814637004363e65bbf4031fcf3.png)](https://gyazo.com/99a890814637004363e65bbf4031fcf3)

* リマインダーとDoyalの関連付け
[![Image from Gyazo](https://i.gyazo.com/75ccdfa81076e92207c27363f3da8d45.png)](https://gyazo.com/75ccdfa81076e92207c27363f3da8d45)


# 実装予定の機能
今後は以下の機能を実装していく予定です。
* ユーザーのグループを作成し、グループでリマインダーを共有する機能
* 設定したジャンルでDoyalやユーザーを検索する機能
* お気に入りのユーザーをフォローする機能
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/cd3914cd3dc987e7bc467002e939e32f.png)](https://gyazo.com/cd3914cd3dc987e7bc467002e939e32f)
# 画面遷移図
https://docs.google.com/spreadsheets/d/1dc9p5378a16hPYYTydRQ0Ujdg2pYyo6_ty7HVVws5Kk/edit?usp=drive_link
# 開発環境
Ruby/Ruby on Rails/JavaScript/MySQL/Github/Visual Studio Code
# 工夫したポイント
リマインダーとしての使いやすさと、見た目のシンプルさ・統一感を損なわないように意識しています。
# 改善点
以下の点について、改善を検討しています。
* Doyalの本文(Doyal memo)のレイアウトが固定されているため、自由度が低い（ブログのように投稿したい）。
* リマインダーとDoyalの関連付けを行う画面にて、詳細が確認できないために不便さを感じる。
* リマインダーとDoyalの関連付けを、重複して設定できてしまう。
* スマートフォンからアクセスすると、使い難い表示になってしまう。
# 製作時間
* 制作期間：14日
* 一日当たりの平均作業時間：7時間
* 合計：100時間程度
