This is a small git repository containing `vim` configuration files which will help to parse [TOPAS](http://www.topasmc.org/) parameter file syntax.

This plugin will provide some syntax highlighting, including highlighting of some common errors.

This plugin was written my Murdock Grewar in 2021. The color scheme is based on [David Hall's `topas-pygments` repository](https://github.com/davidchall/topas-pygments).

---

Instructions for use:

1. For syntax parsing with your default/chosen colour scheme, copy the contents of `syntax` into `~/.vim/syntax/`. You can apply this syntax to an open file in `vim` with `:set syntax=topas`. You may have to use `:syntax on` first.
2. For a colorscheme called `topas`, copy the contents of `colors` into `~/.vim/colors/`. You can use this colourscheme inside vim by running `:colorscheme topas`.
3. For automatic application of the `topas` syntax to TOPAS files, copy the contents of `ftdetect` into `~/.vim/ftdetect/`. Files with the extension `*.topas` will now be opened by `vim` with the `topas` syntax applied automatically.
4. For automatica application of the `topas` color theme to TOPAS files, copy the contents of `ftplugin` into `~/.vim/ftplugin/`. You will then also have to add the line `filetype plugin on` to your `vim` configuration file at `~/.vimrc` in order for this to take effect. 

You should now be able to open `*.topas` files in `vim` and enjoy automatic syntax highlighting as per these screenshots (slightly outdated):
![demo-of-syntax-highlighting](/images/correct_file.png)
![demo-of-syntax-highlighting-bad-syntax](/images/bad_file.png)
