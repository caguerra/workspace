#!/usr/bin/awk -f
BEGIN {}
{if($1=="#1") print $(NF-2), $5, $2, $3}
END {}
