<?php

include __DIR__ . '/../public/init.php';

$di = \Phalcon\Di::getDefault();

$service = $di->get('importService');
$service->getErthmeter();
