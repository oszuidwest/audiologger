## Configuratie includen
source /root/audiologger/config.sh

## Map maken
if [ !$LOGDIR ];
  then
  mkdir -p $LOGDIR
fi

## Oude bestanden verwijderen
find $LOGDIR -type f -mtime +$KEEP -exec rm {} \;

## Vorige uur killen
pids=$(pgrep $STREAMURL)
kill $pids

## Volgende uur opnemen
/usr/bin/wget --background -O $LOGDIR/$TIMESTAMP.mp3 $STREAMURL > /dev/null 2>&1

##KLAAR
