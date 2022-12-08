#!/bin/sh
cd "tsv_files" || exit 1
UScount=0
USvisited=0
USwant=0
ITcount=0
ITvisited=0
ITwant=0
FRcount=0
FRvisited=0
FRwant=0
EScount=0
ESvisited=0
ESwant=0
ENcount=0
ENvisited=0
ENwant=0

for file in *.tsv; do
  US=$(awk 'BEGIN { FS="[\t]"} {
    if(index($4, "United States")){
      print 1
    }
  }' $file)

  if ((US > 0));
    then
      USfileVisited=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $3
        }
      }' $file)

      USfileWant=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $4
        }
      }' $file)

      UScount=$((1+UScount))
      USvisited=$((USfileVisited+USvisited))
      USwant=$((USfileWant+USwant))
      continue;
    fi;

  IT=$(awk 'BEGIN { FS="[\t]"} {
    if(index($4, "Italy")){
      print 1
    }
  }' $file)

  if ((IT > 0));
    then
      ITfileVisited=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $3
        }
      }' $file)

      ITfileWant=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $4
        }
      }' $file)

      ITcount=$((1+ITcount))
      ITvisited=$((ITfileVisited+ITvisited))
      ITwant=$((ITfileWant+ITwant))
      continue;
    fi;

  FR=$(awk 'BEGIN { FS="[\t]"} {
    if(index($4, "France")){
      print 1
    }
  }' $file)

  if ((FR > 0));
    then
      FRfileVisited=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $3
        }
      }' $file)

      FRfileWant=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $4
        }
      }' $file)

      FRcount=$((1+FRcount))
      FRvisited=$((FRfileVisited+FRvisited))
      FRwant=$((FRfileWant+FRwant))
      continue;
    fi;

  ES=$(awk 'BEGIN { FS="[\t]"} {
    if(index($4, "Spain")){
      print 1
    }
  }' $file)

  if ((ES > 0));
    then
      ESfileVisited=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $3
        }
      }' $file)

      ESfileWant=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $4
        }
      }' $file)

      EScount=$((1+EScount))
      ESvisited=$((ESfileVisited+ESvisited))
      ESwant=$((ESfileWant+ESwant))
      continue;
    fi;

  EN=$(awk 'BEGIN { FS="[\t]"} {
    if(index($4, "England")){
      print 1
    }
  }' $file)

  if ((EN > 0));
    then
      ENfileVisited=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $3
        }
      }' $file)

      ENfileWant=$(awk 'BEGIN { FS="[\t]"} {
        if(NR==1){
          print $4
        }
      }' $file)

      ENcount=$((1+ENcount))
      ENvisited=$((ENfileVisited+ENvisited))
      ENwant=$((ENfileWant+ENwant))
      continue;
    fi;

done

numOfPlacesUS="United States nr of places: $UScount"
avgPeopleVisitedUS="Average people that visited United States: $((USvisited / UScount))"
numPeopleWantUS="Total number of people that want to visit United States: $USwant"
echo "$numOfPlacesUS"
echo "$avgPeopleVisitedUS"
echo "$numPeopleWantUS"

numOfPlacesIT="Italy nr of places: $ITcount"
avgPeopleVisitedIT="Average people that visited Italy:$((ITvisited / ITcount))"
numPeopleWantIT="Total number of people that want to visit Italy: $ITwant"
echo "$numOfPlacesIT"
echo "$avgPeopleVisitedIT"
echo "$numPeopleWantIT"

numOfPlacesFR="France nr of places: $FRcount"
avgPeopleVisitedFR="Average people that visited France: $((FRvisited / FRcount))"
numPeopleWantFR="Total number of people that want to visit France: $FRwant"
echo "$numOfPlacesFR"
echo "$avgPeopleVisitedFR"
echo "$numPeopleWantFR"

numOfPlacesES="Spain nr of places: $EScount"
avgPeopleVisitedES="Average people that visited Spain: $((ESvisited / EScount))"
numPeopleWantES="Total number of people that want to visit Spain: $ESwant"
echo "$numOfPlacesES"
echo "$avgPeopleVisitedES"
echo "$numPeopleWantES"

numOfPlacesEN="England nr of places: $ENcount"
avgPeopleVisitedEN="Average people that visited England: $((ENvisited / ENcount))"
numPeopleWantEN="Total number of people that want to visit England: $ENwant"
echo "$numOfPlacesEN"
echo "$avgPeopleVisitedEN"
echo "$numPeopleWantEN"
