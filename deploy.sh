# refer to spf13-vim/bootstrap.sh
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    msg "Trying to update $repo_name"

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi

    debug
}

setup_vundle() {
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

     
    vim    "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"

    export SHELL="$system_shell"

    success "Now updating/installing plugins using Vundle"
    debug
}

today=`date +%Y%m%d`
echo "Step 1: backing up current vim files"
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done

echo "Step 1: backing up current zsh files"
for i in $HOME/.zshrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.zshrc; do [ -L $i ] && unlink $i ; done

echo "Step2: install"
CURRENT_DIR=`pwd`
cp $CURRENT_DIR/.vimrc $HOME/.vimrc
cp $CURRENT_DIR/.zshrc $HOME/.zshrc
cp -r $CURRENT_DIR/.vim $HOME/.vim
mkdir -R $HOME/.vim/tmp/backup

echo "Step 3: install vundle"
[ -z "$VUNDLE_URI" ] && VUNDLE_URI="git@github.com:VundleVim/Vundle.vim.git"
sync_repo       "$HOME/.vim/bundle/Vundle.vim" \
                "$VUNDLE_URI" \
                "master" \
                "vundle"

setup_vundle    

echo "Done"
msg             "\nPersonal configuration for zsh and vim"
