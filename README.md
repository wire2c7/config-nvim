# config-nvim

## For Windows

`make-symlink.bat` を実行することで、デフォルトの設定ファイルが置かれるパス `%LOCALAPPDATA%\nvim` にこのディレクトリのシンボリックリンクを作成します。

### nvim-treesitter プラグインでエラーが出る

nvim-treesitter プラグインを導入しているが、Neovim 起動時に以下のエラーが発生する場合がある。

```
No C compiler found! "cc", "gcc", "clang", "cl", "zig" are not executable.
```

Tree-Sitter が C のコンパイラを必要としており、こちらのプラグインでは環境変数 `%CC%` に設定されている、もしくは `%PATH%` に上記エラーに記載されているコンパイラの実行ファイルが含まれているかを確認する。

Windows に C コンパイラを導入する方法はいくつか存在するが、ここでは Zig をインストールして解決する。

```powershell
winget install -e --id zig.zig
```

