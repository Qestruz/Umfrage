# Dieses Script liest eine CSV-Datendatei in GNU R ein.
# Beim Einlesen werden für alle Variablen Beschriftungen (comment) angelegt.
# Die Beschriftungen für Werte wird ebenfalls als Attribute (attr) abgelegt.

ds_file = file.choose()
# setwd("./")
# ds_file = "rdata_uaumfrage_2023-08-07_23-54.csv"

options(encoding = "UTF-8")
ds = read.delim(
  file=ds_file, encoding="UTF-8", fileEncoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = NULL,
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","AI03","AI04","AI06","AI07",
    "AI07_06","AI08","AI09","AI10","AI11","AI12","AI13","AI14","AI15","E001","P102",
    "P103","P104","P105","P106","P107","P108","P109","SI02","SI03","SI04","SI05",
    "Z001","Z002","Z004","TIME001","TIME002","TIME003","TIME004","TIME005",
    "TIME006","TIME007","TIME008","TIME009","TIME010","TIME011","TIME_SUM",
    "MAILSENT","LASTDATA","FINISHED","Q_VIEWER","LASTPAGE","MAXPAGE","MISSING",
    "MISSREL","TIME_RSI"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="factor", STARTED="POSIXct", AI03="numeric", AI04="numeric",
    AI06="numeric", AI07="numeric", AI07_06="character", AI08="numeric",
    AI09="numeric", AI10="numeric", AI11="numeric", AI12="numeric",
    AI13="numeric", AI14="numeric", AI15="numeric", E001="numeric",
    P102="numeric", P103="numeric", P104="numeric", P105="numeric",
    P106="numeric", P107="numeric", P108="numeric", P109="numeric",
    SI02="numeric", SI03="numeric", SI04="numeric", SI05="numeric",
    Z001="numeric", Z002="numeric", Z004="numeric", TIME001="integer",
    TIME002="integer", TIME003="integer", TIME004="integer", TIME005="integer",
    TIME006="integer", TIME007="integer", TIME008="integer", TIME009="integer",
    TIME010="integer", TIME011="integer", TIME_SUM="integer",
    MAILSENT="POSIXct", LASTDATA="POSIXct", FINISHED="logical",
    Q_VIEWER="logical", LASTPAGE="numeric", MAXPAGE="numeric",
    MISSING="numeric", MISSREL="numeric", TIME_RSI="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

row.names(ds) = ds$CASE

rm(ds_file)

attr(ds, "project") = "uaumfrage"
attr(ds, "description") = "Arbeitsmarktintegration"
attr(ds, "date") = "2023-08-07 23:54:04"
attr(ds, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
ds$AI03 = factor(ds$AI03, levels=c("1","2","3","4","-9"), labels=c("Да / Ja","Нет / Nein","Домохозяйка/домохозяин / Hausfrau/mann","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI04 = factor(ds$AI04, levels=c("1","2","3","4","-9"), labels=c("до 13 250 грн [годовой доход: до 159 000 грн]","13 250–26 500 грн [159 000–318 000 грн]","свыше 26 500 грн [>318 000 грн]","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI06 = factor(ds$AI06, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","В настоящее время нахожусь в процессе активного поиска работы / im Bewerbungsverfahren","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI07 = factor(ds$AI07, levels=c("1","2","3","4","5","6","7","-9"), labels=c("воспитание детей/уход за родственниками / Erziehung oder Pflege von Angehörigen","я пенсионер / Rentner","проблемы со здоровьем / gesundheitliche Probleme","моего пособия хватает на жизнь / Bürgergeld ist ausreichend","нет ответа / Keine Angabe","другие причины: / Andere Gründe:","Изучение немецкого языка / Deutsch lernen","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI08 = factor(ds$AI08, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа /Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI09 = factor(ds$AI09, levels=c("1","2","3","4","5","6","7","-9"), labels=c("слишком низкая заработная плата / Gehalt zu gering","неподходящие условия труда / Arbeitsbedingungen passen nicht","слишком большое расстояние до работы / Entfernung zur Arbeit zu groß","моего пособия хватает на жизнь / Bürgergeld reicht aus","не заинтересован / Keine Lust","нет ответа / Keine Angabe","другие причины: / Andere Gründe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI10 = factor(ds$AI10, levels=c("1","2","3","4","5","6","-9"), labels=c("Очень легко / sehr einfach","Скорее легко / eher einfach","Ни легко, ни сложно / weder einfach noch schwierig","Скорее сложно / eher schwierig","Очень сложно / sehr schwierig","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI11 = factor(ds$AI11, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI12 = factor(ds$AI12, levels=c("1","2","3","4","-9"), labels=c("Да / Ja","Нет / Nein","Мне не предлагали поддержку / Mir wurde keine Unterstützung angeboten","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI13 = factor(ds$AI13, levels=c("1","2","3","4","5","-9"), labels=c("курсы немецкого языка / Deutschkurse","трудоустройство / Arbeitsvermittlung","консультации и поддержка при поиске работы / Beratung und Unterstützung bei der Jobsuche","нет ответа / Keine Angabe","другое: / Sonstige:","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI14 = factor(ds$AI14, levels=c("1","2","-9"), labels=c("Да / Ja","Нет / Nein","[NA] nicht beantwortet"), ordered=FALSE)
ds$AI15 = factor(ds$AI15, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$E001 = factor(ds$E001, levels=c("1","-9"), labels=c("Подтверждаю","[NA] nicht beantwortet"), ordered=FALSE)
ds$P102 = factor(ds$P102, levels=c("1","2","3","4","-9"), labels=c("Мужчина / Männlich","Женщина / Weiblich","Иной / Divers","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$P103 = factor(ds$P103, levels=c("1","2","3","4","5","6","7","-9"), labels=c("15–17 лет","18–25 лет","26–40 лет","41–60 лет","61–67 лет","68 лет и старше","Нет ответа","[NA] nicht beantwortet"), ordered=FALSE)
ds$P104 = factor(ds$P104, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$P105 = factor(ds$P105, levels=c("1","2","3","4","5","6","-9"), labels=c("Не женат/не замужем / Ledig","Женат-a / Verheiratet","Разведен-a / Geschieden","Вдовец/вдова / Witwe","Другое / Sonstige","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$P106 = factor(ds$P106, levels=c("1","2","3","4","5","6","-9"), labels=c("Нет аттестата об окончании школы / Keinen Schulabschluss","Среднее общее образование (школа 9 лет) / Sekundarstufe 1","Среднее полное образование (школа 11/12 лет) / Sekundarstufe 2","Высшее образование / Universitätsabschluss","Профессиональное обучение / Berufsausbildung","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$P107 = factor(ds$P107, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$P108 = factor(ds$P108, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$P109 = factor(ds$P109, levels=c("1","2","3","4","5","-9"), labels=c("ранее чем с 02.2022 / Vor dem 02.2022","прибыли в период с 02.2022 - 06.2022","с 07.2022 - 12.2022","с 01.2023 - настоящее время","не указано / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SI02 = factor(ds$SI02, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SI03 = factor(ds$SI03, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SI04 = factor(ds$SI04, levels=c("1","2","3","4","5","6","-9"), labels=c("Нет ответа / Keine Angabe","1","2","3","4","5","[NA] nicht beantwortet"), ordered=FALSE)
ds$SI05 = factor(ds$SI05, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$Z001 = factor(ds$Z001, levels=c("1","2","3","4","5","6","7","-9"), labels=c("Да, >=1 год","Да, 1-3 года","Да, 3-5 лет,","Да, Более 5 лет","Да, Планирую остаться здесь навсегда / Ich plane für immer hier zu bleiben","Нет, я не хочу оставаться в Германии после войны / Nein, ich möchte nach dem Krieg zurück in die Ukraine","Я все еще не уверен / Ich bin mir noch unsicher","[NA] nicht beantwortet"), ordered=FALSE)
ds$Z002 = factor(ds$Z002, levels=c("1","2","3","4","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine AngabeЯ","Нет ответа / Keine AngabeЯ все еще не уверен / Ich bin mir noch unsicher","[NA] nicht beantwortet"), ordered=FALSE)
ds$Z004 = factor(ds$Z004, levels=c("1","2","3","-9"), labels=c("Да / Ja","Нет / Nein","Нет ответа / Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
attr(ds$FINISHED,"F") = "abgebrochen"
attr(ds$FINISHED,"T") = "ausgefüllt"
attr(ds$Q_VIEWER,"F") = "Teilnehmer"
attr(ds$Q_VIEWER,"T") = "Durchklicker"
comment(ds$SERIAL) = "Personenkennung oder Teilnahmecode (sofern verwendet)"
comment(ds$REF) = "Referenz (sofern im Link angegeben)"
comment(ds$QUESTNNR) = "Fragebogen, der im Interview verwendet wurde"
comment(ds$MODE) = "Interview-Modus"
comment(ds$STARTED) = "Zeitpunkt zu dem das Interview begonnen hat (Europe/Berlin)"
comment(ds$AI03) = "Arbeit in Ukraine"
comment(ds$AI04) = "Einkommen Ukraine"
comment(ds$AI06) = "Berufstätig in DE"
comment(ds$AI07) = "Warum nicht Arbeit DE"
comment(ds$AI07_06) = "Warum nicht Arbeit DE: другие причины: / Andere Gründe"
comment(ds$AI08) = "Jobangebote"
comment(ds$AI09) = "Wrm Job nicht angenommen"
comment(ds$AI10) = "Erfahrung Job DE"
comment(ds$AI11) = "Branche Job"
comment(ds$AI12) = "Unterstützung"
comment(ds$AI13) = "Welche Unterstützung"
comment(ds$AI14) = "Keine Unterstützung"
comment(ds$AI15) = "Probleme Jobsuche"
comment(ds$E001) = "Instruktionstext"
comment(ds$P102) = "Geschlecht"
comment(ds$P103) = "Alter"
comment(ds$P104) = "Rente"
comment(ds$P105) = "Familienstand"
comment(ds$P106) = "Schulabschluss/Ausbildung"
comment(ds$P107) = "Kinder"
comment(ds$P108) = "Alleinerziehend"
comment(ds$P109) = "Aufenthaltsdauer"
comment(ds$SI02) = "Freunde in DE"
comment(ds$SI03) = "Neue F außerhalb"
comment(ds$SI04) = "Job integration Gesellschaft"
comment(ds$SI05) = "Probleme Integration?"
comment(ds$Z001) = "Dauer in DE"
comment(ds$Z002) = "Studium DE"
comment(ds$Z004) = "Staatsbürgerschaft"
comment(ds$TIME001) = "Verweildauer Seite 1"
comment(ds$TIME002) = "Verweildauer Seite 2"
comment(ds$TIME003) = "Verweildauer Seite 3"
comment(ds$TIME004) = "Verweildauer Seite 4"
comment(ds$TIME005) = "Verweildauer Seite 5"
comment(ds$TIME006) = "Verweildauer Seite 6"
comment(ds$TIME007) = "Verweildauer Seite 7"
comment(ds$TIME008) = "Verweildauer Seite 8"
comment(ds$TIME009) = "Verweildauer Seite 9"
comment(ds$TIME010) = "Verweildauer Seite 10"
comment(ds$TIME011) = "Verweildauer Seite 11"
comment(ds$TIME_SUM) = "Verweildauer gesamt (ohne Ausreißer)"
comment(ds$MAILSENT) = "Versandzeitpunkt der Einladungsmail (nur für nicht-anonyme Adressaten)"
comment(ds$LASTDATA) = "Zeitpunkt als der Datensatz das letzte mal geändert wurde"
comment(ds$FINISHED) = "Wurde die Befragung abgeschlossen (letzte Seite erreicht)?"
comment(ds$Q_VIEWER) = "Hat der Teilnehmer den Fragebogen nur angesehen, ohne die Pflichtfragen zu beantworten?"
comment(ds$LASTPAGE) = "Seite, die der Teilnehmer zuletzt bearbeitet hat"
comment(ds$MAXPAGE) = "Letzte Seite, die im Fragebogen bearbeitet wurde"
comment(ds$MISSING) = "Anteil fehlender Antworten in Prozent"
comment(ds$MISSREL) = "Anteil fehlender Antworten (gewichtet nach Relevanz)"
comment(ds$TIME_RSI) = "Ausfüll-Geschwindigkeit (relativ)"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
ds_tmp = data.frame(
  lapply(ds, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(ds_tmp) = attributes(ds)
ds = ds_tmp
rm(ds_tmp)

