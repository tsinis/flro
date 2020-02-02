:globe_with_meridians:  [english](README.md)    |   <u>**český**</u>    |   [русский](README.ru.md)

# FLRO

FLR Optimizer – je skript, založený na AWK, pro optimalizaci souborů FLR ve formátu JSON ([exportovaných z Rive](https://rive.app)). Tento experimentální skript byl výrazně ovlivněn projektem [SVGO](https://github.com/svg/svgo). Prosím, neberte to příliš vážně. :relaxed:

![Screenshot](screenshot.png)

## Proč?
Soubory FLR, zejména ty exportované ve formátu JSON, obvykle obsahují mnoho zbytečných informací. Výsledkem jsou například neoptimální, příliš dlouhé hodnoty apod., které lze bezpečně převést bez výrazného ovlivnění vykreslování FLR animací.

## Kde?

AWK je univerzální počítačový jazyk, navržený pro zpracovávání textových dat a obvykle se používá jako nástroj pro extrakci a vykazování dat. **Jedná se o standardní příkaz většiny UNIXových operačních systémů, jako například macOS či distribuce Linux.**
> **Poznámka k Windows:** Ve výchozím nastavení není v systému Windows příkaz AWK k dispozici. Použijte prosím buď [*gawk*](http://gnuwin32.sourceforge.net/packages/gawk.htm) (budete muset trochu změnit syntaxi příkazu) nebo snadněji – ve Windows 10 (od sestavení č. 14328 či novější), spusťte příkaz přes [*Linux Bash Shell*](https://docs.microsoft.com/cs-cz/windows/wsl/install-win10) *(tam jsem to osobně testoval).*

## Použití

V terminálu přejděte do složky s vašim souborem FLR a spusťte následující příkaz:
````markdown
awk '{
    while (match($0, /[0-9]+\.[0-9]+/)) {
        printf "%s%.2f", substr($0, 1, RSTART-1), substr($0, RSTART, RLENGTH)
        $0 = substr($0, RSTART+RLENGTH)
    }
    print
}' original.flr > optimized.flr
````
#### Parametry:
* **2**f je počet číslic za desetinnou čárkou *(nedoporučuji jej snižovat pod 2)*.
* **original.flr** je název vašeho souboru FLR.
* **optimalizized.flr** je název optimalizovaného souboru FLR.

## Demonstrace ve Flutter
Soubor FLR ze složky [assets](./assets), v tomto repozitáři, byl tímto skriptem optimalizován. Chcete-li vyzkoušet výsledky tohoto skriptu, spusťte v terminálu následující příkazy:
````markdown
flutter upgrade
git clone https://github.com/tsinis/flro.git
cd flro
flutter create .
flutter run
````

## Licence a autorská práva
Tento projekt je vydán pod podmínkami [licence MIT](./LICENSE).