<?php

function key2name($key)
{
$path = 
str_pad(intval(($key-1024*intval($key/1024))/32),3,0,STR_PAD_LEFT)."/".
str_pad((($key-1024*intval($key/1024))/32 - intval(($key-1024*intval($key/1024))/32))*32,3,0,STR_PAD_LEFT);
$a = $key-1024*intval($key/1024);
$d = str_pad(intval(($key-1024*intval($key/1024))/32),3,0,STR_PAD_LEFT);
echo "$a\n$d\n";
return $path;
}
echo key2name('138012');
?>