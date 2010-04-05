#

echo "Loading $HOME/.zshrc"

### shell variables

# zsh が使うシェル変数のうちヒストリ（履歴機能）に関するもの

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=256
SAVEHIST=512
if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
fi

# 自分以外のユーザのログイン・ログアウトを表示するようになる

WATCH=notme

# core ファイルのサイズを 0 に抑制する
unlimit
limit core 0
limit -s

# ファイル作成時のデフォルトのモードを指定する
umask 022

# 端末の設定：Ctrl+H に 1 文字削除、Ctrl+C に割り込み、Ctrl+Z にサスペンド
stty erase '^H'
stty intr '^C'
stty susp '^Z'


### key bindings

# zsh のキーバインドを環境変数 EDITOR に関わらず emacs 風にする

bindkey -e				# EDITOR=vi -> bindkey -v
#bindkey -v                              # EDITOR=vi -> bindkey -v

# ・行全てではなく、カーソル位置から前方だけを削除するように変更
# ・Ctrl+Space によるマーク位置からカーソル位置までを消すように変更
# ・Esc+H で、カーソル前の単語を削除（backward-kill-word より多めに消す）
# ・Esc+. で、コマンドラインの最後の引数を繰り返し挿入する

bindkey '^U' backward-kill-line		# override kill-whole-line
bindkey '^W' kill-region		# override backward-kill-word
bindkey '^[h' vi-backward-kill-word	# override run-help
bindkey '^[.' copy-prev-word		# override insert-last-word


# esc は使いにくいので強引に ctrl に割り振る。
bindkey '^B' backward-word
bindkey '^F' forward-word



## 以下、見通しを良くするために複数ファイルに切り分けて include している ##
## （$ZUSERDIR は .zprofile で指定）                                     ##

### zsh options

# zsh そのものの動作を指定するオプションの設定

if [ -f $ZUSERDIR/zshoptions ]; then
  source $ZUSERDIR/zshoptions
fi


### completions

# 補完の設定を行う compctl の設定ファイルを読み込む

if [ -f $ZUSERDIR/completions ]; then
  source $ZUSERDIR/completions
fi

# see $fpath
autoload -U compinit ; compinit

### aliases

# コマンドに別名をつける alias の設定ファイルを読み込む

if [ -f $ZUSERDIR/aliases ]; then
  source $ZUSERDIR/aliases
fi


### functions

# 複雑な機能を実現する関数 function の設定ファイルを読み込む

if [ -f $ZUSERDIR/functions ]; then
  source $ZUSERDIR/functions
fi


### color ls

# 色つき ls の設定ファイルを読み込む

if [ -f $ZUSERDIR/lscolors ]; then
  source $ZUSERDIR/lscolors
#  alias ll='ls -lAF --color=tty'
fi

### User environment

# ユーザ独自の設定ファイルがあれば読み込む

if [ -f $ZUSERDIR/zshrc.user ]; then
  source $ZUSERDIR/zshrc.user
fi
if [ -f $ZUSERDIR/zshrc.user.git ]; then
  source $ZUSERDIR/zshrc.user.git
fi

