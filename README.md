# NEUTRINO-docker

[NEUTRINO](https://n3utrino.work/) をDocker for Macで動かす用。

NEUTRINO Version.0.103 で動作を確認しています。

## NEUTRINO公式のmacOS版が出ました

**NEUTRINO Version.0.103からmacOS版も公開されるようになりました。**  
https://n3utrino.work/523/

本repoの役割は終えたかもしれません。

## 使い方

Dockerを使ったことがあればREADMEを読めば使えるはずです。

Dockerわからんという人はRomotさんの記事が参考になると思います。  
[MacでAIきりたん(NEUTRINO)をいちから使う方法 - Winいらず](https://note.com/romot/n/n87d2bb0448a8)

## 準備

- NEUTRINO（Linux版）を`./NEUTRINO`に置く

## ビルド

初回実行時とDockerfileに変更があった場合に実行が必要です。

```
$ ./bin/build.sh
```

## 便利な使い方

スクリプトに渡すオプションを読み取って、`./NEUTRINO/Run.sh`を元に`Custom.sh`を生成します。
それを使って合成するので、オプション変更のために`Run.sh`を書き換える手間が不要になります。

### 例

以下のコマンドでは、sample2のスコアを使って、キーを2つあげた音声し、**自動再生**されます。  
（Windows版に合わせて自動再生にしたのですが、`-s play`すれば自動再生されません。音声は `./NEUTRINO/output` に保存されます）

```
$ ./bin/neutrino.sh -n sample2 -p 2
```

### オプション

オプション | 説明 | 有効な値 | デフォルト
--- | --- | --- | ---
-n | スコア名 | `NEUTRINO/score/musicxml/`にあるファイル名（拡張子を除く）| `sample1`
-p | ピッチ | `-12`〜`12`のキーを表す整数。それ以外の数字を指定した場合はPitchShiftにそのまま渡されます | `1.0`
-f | 声質 | 数字（0.85〜1.15を推奨） | `1.0`
-m | モデル | `KIRITAN`か`YOKO` | `KIRITAN`
-s | スキップする処理 | `run`か`play`（`run`が指定されたら再生のみ、`play`が指定されたら合成のみ行われる） | なし

## NEUTRINOのバージョンアップ

```
# 現在のバージョンをリネーム
   $ mv NEUTRINO/ NEUTRINO_0102

# 最新バージョンを配置
$ mv ~/Downloads/NEUTRINO ./NEUTRINO

# スコアを移動
$ mv NEUTRINO_0102/score/musicxml/* NEUTRINO/score/musicxml/

# 動作確認
$ ./bin/neutrino.sh -n sample2
```

## その他の使い方

以下はNEUTRINO標準の`Run.sh`を実行する方法です。
何かおかしいというときは、こちらの方法ならうまくいくかもしれません。

### 実行

`./NEUTRINO/Run.sh`が実行される。

```
$ ./bin/run.sh
```

### 再生

`./NEUTRINO/Run.sh`の`BASENAME`を読み取って、`./NEUTRINO/output/${BASENAME}_syn.wav`を`afplay`で再生。

```
$ ./bin/play.sh
```

### 実行＆再生

`run.sh`の後に`play.sh`を実行。

```
$ ./bin/run_and_play.sh
```

## 謝辞

- https://twitter.com/mattintosh4/status/1233019581880360960  
  Dockerで動作させる方法が参考になりました。
- https://km4osm.com/neutrino-idea/  
  PitchShiftの周波数を利用させていただきました。
