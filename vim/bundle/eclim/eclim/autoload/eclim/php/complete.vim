" Author:  Eric Van Dewoestine
"
" Description: {{{
"   see http://eclim.org/vim/php/complete.html
"
" License:
"
" Copyright (C) 2005 - 2013  Eric Van Dewoestine
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" }}}

" Script Varables {{{
  let s:complete_command =
    \ '-command php_complete -p "<project>" -f "<file>" -o <offset> -e <encoding>'
" }}}

" CodeComplete(findstart, base) {{{
" Handles php code completion.
function! eclim#php#complete#CodeComplete(findstart, base)
  if !eclim#php#util#IsPhpCode(line('.'))
    return eclim#html#complete#CodeComplete(a:findstart, a:base)
  endif

  " passing in a regex to fix completion of php namespaces like:
  "   App\<c-x><c-u>
  "   App\Lib
  return eclim#lang#CodeComplete(
    \ s:complete_command, a:findstart, a:base,
    \ {'temp': 0, 'regex': '\(\w\|\\\)'})
endfunction " }}}

" vim:ft=vim:fdm=marker
