[ 'A' == 'A' ];
echo $?
[ 'A' == 'X' ];
echo $?

if [ 'A' == 'A' ]; then
  echo true
else
  echo false
fi

if [ 'A' == 'X' ]; then
  echo true
else
  echo false
fi
