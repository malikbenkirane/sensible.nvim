" Title:       Sensible
" Description: Peripheral suggested and unenforced defaults
" Maintainer:  malikbenkirane <https://github.com/malikbenkirane>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_sensible")
  finish
endif
let g:loaded_sensible = 1
