# Using Doctrine ORM with Zend Framework 3

## Introduction

This project use skeleton application using the Zend Framework MVC layer and module
systems.

## Installation

[Composer](https://getcomposer.org/). See [documentation](https://getcomposer.org/doc/00-intro.md).


1) Install Zend Framework and others packages:

```bash
$php composer.php update
```

2) Configure connection for database (MySql):

Rename the file:

	 ./config/autoload/development.doctrine.local.php.dist

to new name

	./config/autoload/doctrine.local.php

And now edit the datas to connect on database
	


3) See on the browser using PHP's built-in web server:


```bash
$ php -S localhost:8080 -t public/ public/index.php
```