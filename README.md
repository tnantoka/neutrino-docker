# NEUTRINO-docker

[NEUTRINO](https://n3utrino.work/) をDocker for Macで動かす用。

## 準備

- NEUTRINOを`/NEUTRINO`に置く

## ビルド

初回実行時とDockerfileに変更があった場合に行なう。

```
$ ./bin/build.sh
```

## 実行

`./NEUTRINO/Run.sh`が実行される。

```
$ ./bin/run.sh
```

## 再生

`./NEUTRINO/Run.sh`の`BASENAME`を読み取って、`./NEUTRINO/output/${BASENAME}_syn.wav`を`afplay`で再生。

```
$ ./bin/play.sh
```

## 実行＆再生

`run.sh`の後に`play.sh`を実行。

```
$ ./bin/run_and_play.sh
```

## TODO

- [ ] `BASENAME`や`PitchShift`、`FormantShift`を引数で渡せるように
