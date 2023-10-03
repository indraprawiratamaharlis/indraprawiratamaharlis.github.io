#!/bin/bash

numberofchannels="1"
declare -a a0=("XX - Expired" "Account Expired" "Account Expired" "Account Expired! Hubungi Admin Untuk Mengaktifkan Kembali.\nContact: https://m.me/ryuzxc")

startdaysago=("175000" "193500" "211000" "230000")
enddaysago=("193500" "211000" "230000" "005001")
startyesterday=("005001" "021500" "035000" "054000" "071000" "084500" "101500" "122000" "140000" "154000" "171500" "184000" "201000" "214000" "232000" )
endyesterday=("021500" "035000" "054000" "071000" "084500" "101500" "122000" "140000" "154000" "171500" "184000" "201000" "214000" "232000" "010002")
starttoday=("010002" "023500" "044000" "061500" "073500" "091000" "103500" "121000" "140000" "153000" "170500" "184500" "202500" "214500" "233000")
endttoday=("023500" "044000" "061500" "073500" "091000" "103500" "121000" "140000" "153000" "170500" "184500" "202500" "214500" "233000" "010003")
starttomorrow=("010003" "022500" "040500" "053500" "070000" "083500" "102000" "120500" "134000" "150000" "163500")
endtomorrow=("022500" "040500" "053500" "070000" "083500" "102000" "120500" "134000" "150000" "163500" "180500")
BASEPATH="./guide"
FILENAME="expired.xml"

		offset=$(TZ=WIB date +%z)
		daysago=$(date --date="-2 day" +%Y%m%d)
		yesterday=$(date --date="-1 day" +%Y%m%d)
		today=$(date +%Y%m%d)
		tomorrow=$(date --date="+1 day" +%Y%m%d)

		echo '<?xml version="1.0" encoding="UTF-8" ?>' >> $BASEPATH/$FILENAME
		echo '<tv date="'$today'">' >> $BASEPATH/$FILENAME
        numberofiterations=$(($numberofchannels - 1))

		for i in $(seq 0 $numberofiterations); do # Number of Dummys -1 
			tvgid=a$i[0]
			name=a$i[1]
			echo '    <channel id="'${!tvgid}'">' >> $BASEPATH/$FILENAME
			echo '        <display-name lang="en">'${!name}'</display-name>' >> $BASEPATH/$FILENAME
			echo '    </channel>' >> $BASEPATH/$FILENAME
		done

		for i in $(seq 0 $numberofiterations) ;do
			tvgid=a$i[0]
			title=a$i[2]
			desc=a$i[3]

			for da in {0..3}; do
					echo '    <programme start="'$daysago${startdaysago[$da]}' '$offset'" stop="'$daysago${enddaysago[$da]}' '$offset'" channel="'${!tvgid}'">' >> $BASEPATH/$FILENAME
					echo '        <title lang="en">'${!title}'</title>' >> $BASEPATH/$FILENAME
					echo '        <desc lang="en">'${!desc}'</desc>' >> $BASEPATH/$FILENAME
					echo '    </programme>' >> $BASEPATH/$FILENAME
			done
			for yd in {0..14}; do
					echo '    <programme start="'$yesterday${startyesterday[$yd]}' '$offset'" stop="'$yesterday${endyesterday[$yd]}' '$offset'" channel="'${!tvgid}'">' >> $BASEPATH/$FILENAME
					echo '        <title lang="en">'${!title}'</title>' >> $BASEPATH/$FILENAME
					echo '        <desc lang="en">'${!desc}'</desc>' >> $BASEPATH/$FILENAME
					echo '    </programme>' >> $BASEPATH/$FILENAME
			done
			for td in {0..14}; do
					echo '    <programme start="'$today${starttoday[$td]}' '$offset'" stop="'$today${endttoday[$td]}' '$offset'" channel="'${!tvgid}'">' >> $BASEPATH/$FILENAME
					echo '        <title lang="en">'${!title}'</title>' >> $BASEPATH/$FILENAME
					echo '        <desc lang="en">'${!desc}'</desc>' >> $BASEPATH/$FILENAME
					echo '    </programme>' >> $BASEPATH/$FILENAME
			done
		        for tm in {0..10}; do
					echo '    <programme start="'$tomorrow${starttomorrow[$tm]}' '$offset'" stop="'$tomorrow${endtomorrow[$tm]}' '$offset'" channel="'${!tvgid}'">' >> $BASEPATH/$FILENAME
					echo '        <title lang="en">'${!title}'</title>' >> $BASEPATH/$FILENAME
					echo '        <desc lang="en">'${!desc}'</desc>' >> $BASEPATH/$FILENAME
					echo '    </programme>' >> $BASEPATH/$FILENAME
			done
		done

		echo '</tv>' >> $BASEPATH/$FILENAME

sleep 2

sed -i 's|'${daysago}'005001|'${yesterday}'005001|g' $BASEPATH/$FILENAME
sed -i 's|'${yesterday}'010002|'${today}'010002|g' $BASEPATH/$FILENAME
sed -i 's|'${today}'010003|'${tomorrow}'010003|g' $BASEPATH/$FILENAME
