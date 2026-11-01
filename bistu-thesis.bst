%% BISTU screenshot-aligned numeric BibTeX style, 2026-09-27.
%% This is an original project-local style. Entries remain in UTF-8 .bib files.
%% Order: first citation. Punctuation and fields follow the supplied screenshot.
ENTRY
  { author editor translator title booktitle journal journaltitle
    address location publisher school institution organization
    year date volume number pages edition url howpublished
    language langid mark entrysubtype }
  {} {}
INTEGERS { nameptr numnames namesleft bibcount }
STRINGS { namelist nameresult onename a b pagetext pageresult }
FUNCTION {not} { { #0 } { #1 } if$ }
FUNCTION {and} { 'skip$ { pop$ #0 } if$ }
FUNCTION {or} { { pop$ #1 } 'skip$ if$ }
FUNCTION {field.or.null} { duplicate$ empty$ { pop$ "" } 'skip$ if$ }
FUNCTION {is.chinese}
{ language field.or.null "chinese" =
  language field.or.null "zh" = or
  langid field.or.null "chinese" = or
  langid field.or.null "zh" = or }
FUNCTION {format.names}
{ 'namelist :=
  namelist num.names$ 'numnames :=
  #1 'nameptr :=
  "" 'nameresult :=
  { nameptr numnames > not nameptr #4 < and }
  { namelist nameptr "{vv~}{ll}{~jj}{~f}" format.name$ 'onename :=
    onename "others" =
      { is.chinese { "等" } { "et~al." } if$ 'onename := }
      { is.chinese 'skip$ { onename "u" change.case$ 'onename := } if$ }
    if$
    nameresult empty$
      { onename 'nameresult := }
      { nameresult ", " * onename * 'nameresult := }
    if$
    nameptr #1 + 'nameptr :=
  } while$
  numnames #3 >
    { nameresult ", " * is.chinese { "等" } { "et~al." } if$ * 'nameresult := }
    'skip$ if$
  nameresult }
FUNCTION {format.authors}
{ author empty$
    { editor empty$
        { organization field.or.null }
        { editor format.names } if$ }
    { author format.names } if$ }
FUNCTION {format.title}
{ title empty$
    { "Missing title in " cite$ * warning$ "[题名待填写]" }
    { title } if$ }
FUNCTION {format.address}
{ address empty$ { location field.or.null } { address } if$ }
FUNCTION {format.publisher}
{ publisher empty$
    { school empty$
        { institution empty$ { organization field.or.null } { institution } if$ }
        { school } if$ }
    { publisher } if$ }
FUNCTION {format.year}
{ year empty$ { date empty$ { "" } { date #1 #4 substring$ } if$ } { year } if$ }
FUNCTION {format.date}
{ date empty$ { year field.or.null } { date } if$ }
FUNCTION {format.imprint}
{ format.address 'a := format.publisher 'b :=
  a empty$ { b } { b empty$ { a } { a ": " * b * } if$ } if$
  'a := format.year 'b :=
  a empty$ { b } { b empty$ { a } { a ", " * b * } if$ } if$ }
FUNCTION {format.pages}
{ pages field.or.null 'pagetext := "" 'pageresult :=
  { pagetext empty$ not }
  { pagetext #1 #1 substring$ "-" =
      { pageresult "～" * 'pageresult :=
        { pagetext #1 #1 substring$ "-" = }
        { pagetext #2 global.max$ substring$ 'pagetext := } while$ }
      { pageresult pagetext #1 #1 substring$ * 'pageresult :=
        pagetext #2 global.max$ substring$ 'pagetext := }
    if$
  } while$ pageresult }
FUNCTION {format.journal}
{ journal empty$ { journaltitle field.or.null } { journal } if$ }
FUNCTION {tag}
{ mark empty$ 'skip$ { pop$ mark } if$
  "[" swap$ * "]" * }
FUNCTION {dot.write}
{ duplicate$ empty$ { pop$ } { ". " write$ write$ } if$ }
FUNCTION {comma.write}
{ duplicate$ empty$ { pop$ } { ", " write$ write$ } if$ }
FUNCTION {colon.write}
{ duplicate$ empty$ { pop$ } { ": " write$ write$ } if$ }
FUNCTION {start.bibitem}
{ newline$ "\bibitem{" write$ cite$ write$ "}" write$ newline$ }
FUNCTION {start.entry}
{ start.bibitem
  format.authors duplicate$ empty$
    { pop$ "Missing author/editor/organization in " cite$ * warning$ }
    { add.period$ write$ " " write$ } if$ }
FUNCTION {fin.entry} { "." write$ newline$ }
FUNCTION {write.translators}
{ translator empty$ 'skip$
    { ". (" write$ translator format.names write$
      is.chinese { ", 译)" } { ", trans.)" } if$ write$ }
  if$ }
FUNCTION {monograph}
{ 'b := start.entry format.title write$ b tag write$
  write.translators
  edition field.or.null dot.write
  format.imprint dot.write
  format.pages dot.write
  fin.entry }
FUNCTION {book} { "M" monograph }
FUNCTION {booklet} { book }
FUNCTION {proceedings} { "C" monograph }
FUNCTION {collection} { proceedings }
FUNCTION {phdthesis} { "D" monograph }
FUNCTION {mastersthesis} { phdthesis }
FUNCTION {techreport} { "R" monograph }
FUNCTION {report} { techreport }
FUNCTION {standard}
{ start.entry
  number empty$ 'skip$ { number add.period$ write$ " " write$ } if$
  format.title write$ "S" tag write$
  format.imprint dot.write format.pages dot.write fin.entry }
FUNCTION {article}
{ start.entry format.title write$ "J" tag write$
  format.journal dot.write format.year comma.write
  volume field.or.null comma.write
  number empty$ 'skip$ { "(" write$ number write$ ")" write$ } if$
  format.pages colon.write fin.entry }
FUNCTION {inproceedings}
{ start.entry format.title write$
  booktitle field.or.null dot.write "C" tag write$
  format.imprint dot.write format.pages dot.write fin.entry }
FUNCTION {conference} { inproceedings }
FUNCTION {incollection}
{ start.entry format.title write$ "A" tag write$
  booktitle field.or.null dot.write "[C]" write$
  format.imprint dot.write format.pages dot.write fin.entry }
FUNCTION {inbook} { incollection }
FUNCTION {patent}
{ start.entry format.title write$
  format.address 'a := number field.or.null 'b :=
  a empty$ { b } { b empty$ { a } { a ", " * b * } if$ } if$ colon.write
  "P" tag write$ format.date dot.write fin.entry }
FUNCTION {online}
{ start.bibitem format.authors duplicate$ empty$
    { pop$ } { write$ ", " write$ } if$
  format.title write$ "EB/OL" tag write$
  url empty$
    { howpublished field.or.null dot.write }
    { "\url{" url * "}" * dot.write } if$
  format.date comma.write fin.entry }
FUNCTION {electronic} { online }
FUNCTION {newspaper}
{ start.entry format.title write$ "N" tag write$
  format.journal dot.write format.date comma.write
  number empty$ 'skip$ { "(" write$ number write$ ")" write$ } if$
  format.pages colon.write fin.entry }
FUNCTION {misc}
{ url empty$ { "Z" monograph } { online } if$ }
FUNCTION {manual} { book }
FUNCTION {unpublished} { misc }
FUNCTION {default.type} { misc }
FUNCTION {init.count} { #0 'bibcount := }
FUNCTION {count.entry} { bibcount #1 + 'bibcount := }
FUNCTION {begin.bib}
{ "\begin{thebibliography}{" write$ bibcount int.to.str$ write$ "}" write$ newline$
  "\providecommand{\url}[1]{\texttt{#1}}" write$ newline$ }
FUNCTION {end.bib}
{ newline$ "\end{thebibliography}" write$ newline$ }
READ
EXECUTE {init.count}
ITERATE {count.entry}
EXECUTE {begin.bib}
ITERATE {call.type$}
EXECUTE {end.bib}
