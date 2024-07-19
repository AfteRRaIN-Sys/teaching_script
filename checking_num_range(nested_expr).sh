if ( [ ! -z "$1" ] ) && ! ( [ $1 -ge 10 ] || [ $1 -lt 0 ] )
then
    echo "$1 is non-empty and in range [0, 9]"
elif [ -z "$1" ]
then   
    echo "\$1 is empty"
else
    echo "$1 is non-empty but not in range [0, 9]"
fi