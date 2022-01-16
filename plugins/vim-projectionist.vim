Plug 'tpope/vim-projectionist'


let g:projectionist_heuristics = {
    \ "bin/console": {
    \   "src/*.php": {
    \     "type": "source",
    \     "alternate": [
    \       "tests/Functional/{}Test.php",
    \       "tests/Integration/{}Test.php",
    \       "tests/Unit/{}Test.php",
    \     ]
    \   },
    \   "tests/Functional/*Test.php": {
    \     "type": "test",
    \     "alternate": "src/{}.php",
    \   },
    \   "tests/Integration/*Test.php": {
    \     "type": "test",
    \     "alternate": "src/{}.php",
    \   },
    \   "tests/Unit/*Test.php": {
    \     "type": "test",
    \     "alternate": "src/{}.php",
    \   },
    \ }}

