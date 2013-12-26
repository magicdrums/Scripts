<?php
define('KEY', '$1');
function encripta($text)
{
    return trim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, KEY, $text, MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND))));
}
function desencripta($text)
{
    return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, KEY, base64_decode($text), MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND)));
}
echo desencripta("$2");
?>
