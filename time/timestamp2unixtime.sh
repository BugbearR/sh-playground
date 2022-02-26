#!/bin/sh

# see https://qiita.com/richmikan@github/items/14e32d099bd9bcc7f8e8
# @param $1 YYYYMMDDhhmmss(UTC)
timestamp2unixtime()
{
    echo "$1" | awk '
{
    Y = substr($1, 1,4)*1;
    M = substr($1, 5,2)*1;
    D = substr($1, 7,2)*1;
    h = substr($1, 9,2)*1;
    m = substr($1,11,2)*1;
    s = substr($1,13  )*1;

    # 計算公式に流し込む
    if (M<3) {M+=12; Y--;} # 公式を使うための値調整
    print (365*Y+int(Y/4)-int(Y/100)+int(Y/400)+int(306*(M+1)/10)-428+D-719163)*86400+(h*3600)+(m*60)+s;
}
'
}

if [ $# -lt 1 ]
then
    printf '%s\n' $(timestamp2unixtime $(date -u +'%Y%m%d%H%M%S'))
else
    printf '%s\n' $(timestamp2unixtime "$1")
fi
