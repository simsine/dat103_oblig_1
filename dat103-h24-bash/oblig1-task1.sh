#! /bin/bash

# Oppgave 1
# Vi sletter mappen task1-bash hvis den allerede eksisterer
if [ -d "task1-bash" ]; then
    rm -r task1-bash
fi
# Vi lager så mappen på nytt
mkdir task1-bash

# Oppgave 2
# Vi kopierer filen jurassicParkCast.txt inn i mappen
cp jurassicParkCast.txt ./task1-bash
# Vi beveger oss inn i mappen
cd task1-bash
# Vi endrer navnet på filen til cast.txt
mv jurassicParkCast.txt cast.txt

# Oppgave 3
# Vi printer innholdet i mappen, som er filen cast.txt
ls

echo "--------------------------"
# Oppgave 5
# Vi leser ut filen og hopper over første linje
# Resultatet av dette sendes til sort som sorterer 5. kolonne numerisk,
# med ',' som delimiter mellom radene
tail -n +2 cast.txt | sort -t "," -n -k 5

echo "--------------------------"
# Oppgave 7
# Vi finner linjer som inneholder bokstaven 'L'
# Dette gir riktig resultat siden headeren har små bokstaver
# og hvis en av linjene inneholder 'L' er det fordi det er starten på et navn
grep L cast.txt

echo "--------------------------"
# Oppgave 9
# Vi velger linjer med kvinner eller enkelt ved å søke etter linjer med ,F, eller ,M,
grep ",F," cast.txt > women.txt
cat women.txt

echo "--------------------------"
# Oppgave 11
grep ",M," cast.txt > men.txt
cat men.txt

echo "--------------------------"
# Oppgave 13
for fileName in *; do
    for i in {1,2}; do
        baseName="${fileName%.txt}"
        cp "$fileName" "$baseName-$i.txt"
    done
done

# Oppgave 14
wc ./* 
