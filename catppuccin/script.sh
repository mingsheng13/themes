#!/usr/bin/env bash

text=$(<$1)
echo "$text" | sed -E -e '/(\<th\>|rgb|hsl|summary)/d' -e 's/[[:space:]]*<[^>]*>[[:space:]]*//g' -e '/^[[:space:]]*$/d' | awk 'NR%2{printf $0"="; next}{print $0}' | awk 'BEGIN {FS="#";OFS="#ff";print "#!/usr/bin/env bash"} {$1=$1;print}' > $1.sh
