# Dotfiles for Emacs

## Requirement

### Cask

    # install Cask
    ## Mac
    $ brew install cask
    ## other
    $ curl -fsSkL https://raw.github.com/cask/cask/master/go | python

    # install packages
    $ cd ~/.emacs.d/
    $ cask install

## Directories

    .
    ├── conf                : detailed configulations
    ├── elisp               : elisps
    ├── elpa                : extensions installed with package management system (ignored)
    ├── insert-templates    : templates
    ├── my-snippets         : snippets for yasnippet
    └── vendor              : extensions installed with OTHER THAN package management system