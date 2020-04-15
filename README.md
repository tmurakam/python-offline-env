# Python offline env / installer

Python のオフライン環境・インストーラです。

完全オフラインな環境にパッケージ(Ansibleなど)をセットアップするためのものです。

## 必要環境

以下のいずれか

* Python 3
* Python 2 + virtualenv

両方が存在する場合は、Python 3 が優先されます。

強制的に Python 2 を使用する場合は、download.sh および install.sh の引数に
"-2" を指定してください。


## インストーラの生成

requirements.txt に必要なパッケージ一覧を記述してください。

download.sh を実行すると、/opt/python-env に仮想環境が生成され、これを使用して
パッケージ(pip, setuptools, requirements.txt に記載されたパッケージ)が
installer ディレクトリ以下に生成されます。

## インストール

installer 以下のディレクトリをオフライン環境にコピーし、install.sh を実行
することでインストールが実行されます。

バイナリは /opt/python-env/bin/ にインストールされます。

本ディレクトリに PATH を通すか、/opt/python-bin/env/activate を source
して使用してください。



