#!/bin/bash

echo "Enter 1 install from account";
read installinit;

installaccount=$(waldo ${installinit} | tail -2 | head -1 | cut -d':' -f2);
errorsum=0;

for i in ${installaccount}; do
    errorcount=$(zcat -f /var/log/nginx/${i}.access.log /var/log/nginx/${i}.access.log.1 /var/log/nginx/${i}.access.log.2 /var/log/nginx/${i}.access.log.3 /var/log/nginx/${i}.access.log.4 /var/log/nginx/${i}.access.log.5 /var/log/nginx/${i}.access.log.6 | grep '|50[0-9]|' | wc -l)
    errorsum=$( ${errorcount} + ${errorsum} | bc);
done

printf "\r\nFor Account of ${installinit} N of 504s for 7 days: ${errorsum}\r\n";

