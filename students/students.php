<?php
echo('
<head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="Beispiel-Design Nr. 03 von SelfHTML.org" />
            <link rel="stylesheet" href="students.css">
                <title>SelfHTML Design 03</title>
</head>
<body>

<header>
    <a class="ribbon" tabindex="-1" title="zurück zur Startseite!" href="index.html">
        <h1 id="logo">SelfHTML Design 03</h1>
        <p>Deine Suche für Hochschulen</p>
    </a>
</header>

<main>

    <nav id="navigation">
        <ul>
            <li><a aria-current="page">Home</a></li>
            <li><a href="1-unterseite.html">Über uns</a></li>
            <li><a href="1-unterseite.html#">Leistungen</a></li>
            <li><a href="1-unterseite.html">Referenzobjekte</a>
                <li><a href="1-unterseite.html">Anfahrt</a></li>
                <li><a href="2-contact.html">Kontakt</a></li>
        </ul>
    </nav>

    <section id="intro">
        <h2>Willkommen <span>bei Company Mustermann GmbH</span></h2>
        <p>
Dies ist das <strong>SelfHTML Design Nr.03</strong>. Sie dürfen dieses Template kopieren, verändern, veröffentlichen, sogar zu kommerziellen Zwecken, ohne um weitere Erlaubnis bitten zu müssen.
        </p>
    </section>


    <section class="spalte">
        <h2>Lorem ipsum</h2>
        <p>
            <img src="img/dummy-3.jpg" alt="Dummybild - bitte Alternativbeschreibung einfügen">
    Lorem ipsum dolor sit amet conis ectetuer adipiscing elit sed diame nonummy nibh euismod incidunt uti laoreetdo lore magna aliquami erat volutipat. Ut wisi enim admini m veniam, quis nostrud exercitatn ullamcorper suscipit lobortis nislit aliquip ex ea commodo consequat. Duis autemi vel eum iriure dolor in hendrerit in vulputate velites.<br>
                <a class="more" href="1-unterseite.html">weiter lesen</a>
        </p>
    </section>


    <section class="spalte">
        <h2>Lorem ipsum</h2>
        <p>
Lorem ipsum dolor sit amet consectetiu eradipiscing elit sed diam.
        </p>
        <ul class="square">
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum dolor</a></li>
            <li><a href="#">Lorem ipsmum dolor sit</a></li>
            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
        </ul>
        <a class="more" href="1-unterseite.html">weiter lesen</a>
    </section>

</main>

<footer class="grid">
    <ul id="footer-nav">
        <li><a href="2-contact.html" title="Kontakt"><img src="img/info.svg" alt="info"></a></li>
        <li><a href="#" title="Sitemap"><img src="img/sitemap.svg" alt="info"></a></li>
        <li><a href="2-contact.html" title="impressum"><img src="img/print.svg" alt="print"></a></li>
    </ul>
    <p>
Design: Duit, <a href="http://designenlassen.de/">designenlassen.de</a><br>
technische Umsetzung: <a href="http://selfhtml.org">selfhtml.org</a>
    </p>
</footer>

</body>
</html>
');