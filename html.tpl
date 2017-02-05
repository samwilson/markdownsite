<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />

    $for(author-meta)$
    <meta name="author" content="$author-meta$" />
    $endfor$

    $if(date-meta)$
    <meta name="date" content="$date-meta$" />
    $endif$

    <title>$if(title-prefix)$$title-prefix$ - $endif$$pagetitle$</title>
    <link rel="stylesheet" href="$relpath$style.css" />

    $for(header-includes)$
    $header-includes$
    $endfor$
</head>
<body>

    $for(include-before)$
    $include-before$
    $endfor$

    $if(title)$
    <header>
        <h1>$title$</h1>
        $if(subtitle)$
        <p class="subtitle">$subtitle$</p>
        $endif$

        $if(date)$
        <p class="date">$date$</p>
        $endif$
    </header>
    $endif$

    $if(abstract)$
    <section id="abstract">
    $abstract$
    </section>
    $endif$


    $if(toc)$
    <div id="$idprefix$TOC">$toc$</div>
    $endif$

    <article id="body">
    $body$
    </article>

    $for(include-after)$
    $include-after$
    $endfor$

    <footer>
        <p>
            <a href="$relpath$$filename$.pdf">Printable version</a>
        </p>
    </footer>
</body>
</html>
