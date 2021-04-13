#!/bin/bash

echo '{ "version": 1, "click_events":true }'
echo '['
echo '[]'

# Now send blocks with information forever:
(while :;
do
  echo -n ",[{\"name\":\"id_bat\",\"full_text\":\"$(~/.config/i3/bat.sh)  \"},"
  echo -n "{\"name\":\"id_time\",\"full_text\":\"$(date +" %H:%M  ")\"}]"
  sleep 2 
done) &

# Listening for STDIN events
while read line;
do
  # DATE click
  if [[ $line = *"name"*"id_time"* ]]; then
    gsimplecal &
  fi  
done
exit

