vnoremap <silent><buffer> D :<c-u>call SurroundVaddPairs("/** ", " */")<cr>
vnoremap <silent><buffer> T :<c-u>call SurroundVaddPairs("try {", "} catch (e) {}")<cr>
