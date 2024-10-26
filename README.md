# config-nvim

## For Windows

`make-symlink.bat` を実行することで、デフォルトの設定ファイルが置かれるパス `%LOCALAPPDATA%\nvim` にこのディレクトリのシンボリックリンク（実態はジャンクション）を作成する。

### nvim-treesitter プラグインでエラーが出る

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) プラグインを導入している。

Neovim 起動時にこのプラグインが次のエラーを発生させる場合がある。

> No C compiler found! "cc", "gcc", "clang", "cl", "zig" are not executable.

Tree-Sitter は上記エラーに記載されている C のコンパイラのいずれかを必要としており、このプラグインは環境変数 `CC` に設定されている C  コンパイラ、もしくは環境変数 `PATH` に設定されているディレクトリ内に C コンパイラの実行ファイルが含まれているかを確認している。

Windows に C コンパイラを導入する方法はいくつか存在するが、ここでは [WinGet](https://learn.microsoft.com/ja-jp/windows/package-manager/winget/) を使用し [Zig](https://ziglang.org/ja-JP/) をインストールして解決する方法を示す。

```powershell
winget install -e --id zig.zig
```

