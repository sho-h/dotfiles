# Small aliases to get along with Emacs buffer.
# from https://gist.github.com/1244467

## Invoke the ``dired'' of current working directory in Emacs buffer.
function dired () {
  emacsclient -e "(dired \"$PWD\")"
}

## Chdir to the ``default-directory'' of currently opened in Emacs buffer.
function cde () {
    EMACS_CWD=`emacsclient -e "
     (expand-file-name
      (with-current-buffer
          (nth 1
               (assoc 'buffer-list
                      (nth 1 (nth 1 (current-frame-configuration)))))
        default-directory))" | sed 's/^"\(.*\)"$/\1/'`

    echo "chdir to $EMACS_CWD"
    cd "$EMACS_CWD"
}

# Local variables:
# mode: sh
# coding: euc-jp
# End:
