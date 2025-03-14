# dotfiles

MacOSで環境構築するためのリポジトリ

## 内容

1. 各ソフトをインストールする

   * Xcodeのインストール
   * Homebrewのインストール
   * Nodebrewのインストール
   * Ryeのインストール
   * uvのインストールs
   * zintのインストール
     * zshのプラグインマネージャー
   * Homebrewで必要なもののインストール

2. 各dotfileにシンボリックリンクを作成する

   * `.zshrc`のシンボリックリンクを `$HOME/.zshrc`に作成
     * zshの基本的な設定を記述
     * `.alias`と `.function`を読み込む
   * `.alias`のシンボリックリンクを `$HOME/.alias`に作成
     * aliasはここにすべてここに記述
   * `.function`のシンボリックリンクを `$HOME/.function`に作成
     * 自作定義した関数はすべてここに記述
   * `.tmux.conf`のシンボリックリンクを `$HOME/.tmux.conf`に作成
     * tmuxの基本的な設定
   * シンボリックリンクを設定することで各dotfileがここで編集できる

## 環境構築

### `init.sh` に権限を付与

```sh
chmod +x init.sh
```

### `init.sh` を実行

```sh
./init.sh
```
