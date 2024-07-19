i=1

if [ -z "$1" ]
then
    echo "no param given"
    exit
fi

while [ $i -le $1 ]
do

    LEN=0
    STARS=""

    while [ $LEN -lt $i ]
    do
        LEN=$(($LEN+1))
        STARS="$STARS*"
    done
    echo "$STARS"

    i=$((i+1))

done