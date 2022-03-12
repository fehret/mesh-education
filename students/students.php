<head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="Beispiel-Design Nr. 03 von SelfHTML.org" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

    <div class="topnav">
        <a class="active" href="#home">Home</a>
        <a href="list.html">Studiengänge</a>
        <a href="#about">Hochschulorte</a>        
        <a href="#about">Hochschule</a>
        <table style="float: right">
            <form action="studiengang.html" method = "get">
                <input name="study" type="text" placeholder="Suche nach Studiengang.." style="margin-left:10%" required>
                <input name="location" type="text" placeholder="Suche nach Standort..   "                         required>
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </table>
    </div>

<main>

    <nav id="navigation">
        <ul>
            <li><a aria-current="page">Willkommen</a></li>
            <li><a href="1-unterseite.html">Was interessiert mich?</a></li>
            <li><a href="1-unterseite.html">Q&A</a>
                <li><a href="1-unterseite.html">Über uns</a></li>
                <li><a href="2-contact.html">Kontakt</a></li>
        </ul>
    </nav>

    <section id="intro">
        <h2>Dein Studiengangsfinder <span> für viele Universitäten</span></h2>
        <p>
            Sucht du <strong>DEIN Studiengang</strong>, der für dich am besten passt oder interessierst du dich schon für ein Fach und du möchtest dich noch mehr informieren? </br>
            </br>Dann bist du <strong>hier</strong> genau richtig. Es gibt zahlreiche Studenten, die nach dem ersten Semester abbrechen und wir helfen dir nicht Teil dieser Gruppe zu sein
        </p>
    </section>


    <section class="spalte">
        <h2>Welcher Studiengang passt zu mir?</h2>
        <p>
            Ob geistige, soziale oder intellektuelle Studiengänge, in denen Du mit kreativer Kompetenz profilieren kannst oder technische, wirtschaftliche Studiengänge, in denen logische Lösungsansätzen der Key ist.
            Nun, du weißt noch nicht was zu dir passt? Keine Bange, wir haben für Dich einen Fragebogen, der für Dich individuell selektiert, welcher Studiengang am besten passt. <a class="more" href="students.php#Test">Hier</a>
        </p>
    </section>


    <section class="spalte">
        <h2>Ich habe noch weitere Fragen</h2>
        <p>
            Studenten beantworten viele Fragen für Dich!
            Wenn du Fragen hast, klicke einfach <a class="more" href="1-unterseite.html">hier</a>
        </p>
        <ul class="square">
            <li><a href="#">Wie kann einen Studiengang finden?</a></li>
            <li><a href="#">Wo finde ich die Kontaktdaten eines Studiengangs?</a></li>
            <li><a href="#">Wo kann ich mich für einen Studiengang bewerben?</a></li>
            <li><a href="#">Was sind die Anforderungen für einen Studiengang?</a></li>
        </ul>

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