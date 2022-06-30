# dannalc HP 開発環境構築方法

## 必要なもの

### Docker をインストールする

[Docker Desktop](https://www.docker.com/products/docker-desktop/) をインストールする。

### mysql-client をインストールする

brew を利用する。brew が入っていないなら下記コマンドでインストールする。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

インストールできたら、下記コマンドで mysql-client をインストールする。
```
brew install mysql-client
```

## WordPress ソースコードを持ってくる

本番環境のソースコードをローカルに持ってくる。

[Cyberduck](https://cyberduck.softonic.jp/mac) などのFTPクライアントをインストールして、本番サーバーからソースコードを落とす。

本番サーバーは[さくらコントロールパネル](https://secure.sakura.ad.jp/rs/cp/)のFTP情報をもとに設定する。

`www` ディレクトリ下の `dannalc` をダウンロードし、`html` という名前でこのリポジトリ直下に持ってくる。
`html/wp-config.php` を下記のように変更する。
```html/wp-config.php
/** WordPress のためのデータベース名 */
define('DB_NAME', 'nomitabi-ningyoc_dannalc');

/** MySQL データベースのユーザー名 */
define('DB_USER', 'root');

/** MySQL データベースのパスワード */
define('DB_PASSWORD', 'somewordpress');

/** MySQL のホスト名 */
define('DB_HOST', 'db');
```

## 本番DBを同期する

[phpMyAdmin](https://secure.sakura.ad.jp/rs/db/mysql5/server_export.php) から本番DBをエクスポートする。

ローカルでDBサーバー・WordPressサーバーを立ち上げる。
このリポジトリの直下で下記コマンドを実行する。
```
docker-compose up -d
```

エクスポートした内容をDBにインポートする。
下記コマンドで取り込む。
```
cat ~/Downloads/mysql646_db_sakura_ne_jp.sql | mysql -h 0.0.0.0 -uroot -psomewordpress
cat setup.sql | mysql -h 0.0.0.0 -uroot -psomewordpress
```

これで本番環境と同じものがローカルで動く。それぞれ下記のURLでアクセスできる。
- HPトップ：http://localhost:8000
- 管理画面トップ：http://localhost:8000/wp-admin/
