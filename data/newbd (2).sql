-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 11 2020 г., 11:56
-- Версия сервера: 5.7.30-0ubuntu0.16.04.1
-- Версия PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `newbd`
--

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `getLastProducts`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `getLastProducts` (
`user_name` varchar(55)
,`product_name` varchar(255)
,`product_price` float
,`product_created_at` timestamp
);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `created`) VALUES
(1, 'продукт №1', 101, '2020-08-10 16:20:10'),
(2, 'продукт №2', 103, '2020-08-10 16:21:22'),
(3, 'продукт №3', 102, '2020-08-10 16:21:22'),
(4, 'продукт №4', 103, '2020-08-10 16:21:22'),
(5, 'продукт №5', 102, '2020-08-10 16:21:22'),
(6, 'продукт №6', 104, '2020-08-10 16:21:22'),
(7, 'продукт №7', 103, '2020-08-10 16:21:22'),
(8, 'продукт №8', 103, '2020-08-10 16:21:22'),
(9, 'продукт №9', 101, '2020-08-10 16:21:22'),
(10, 'продукт №10', 104, '2020-08-10 16:21:22');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'Пользователь №1'),
(2, 'Пользователь №2'),
(3, 'Пользователь №3'),
(4, 'Пользователь №4'),
(5, 'Пользователь №5'),
(6, 'Пользователь №6'),
(7, 'Пользователь №7'),
(8, 'Пользователь №8'),
(9, 'Пользователь №9');

-- --------------------------------------------------------

--
-- Структура таблицы `users_product`
--

CREATE TABLE `users_product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `dt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_product`
--

INSERT INTO `users_product` (`id`, `user_id`, `product_id`, `dt_created`) VALUES
(1, 1, 1, '2020-08-10 23:40:35'),
(3, 1, 2, '2020-08-10 23:41:35'),
(4, 1, 4, '2020-08-10 23:42:35'),
(5, 1, 3, '2020-08-10 23:43:35'),
(6, 2, 1, '2020-08-10 23:44:35'),
(7, 2, 3, '2020-08-10 23:45:35'),
(8, 2, 6, '2020-08-10 23:46:35'),
(9, 2, 7, '2020-08-10 23:47:35'),
(10, 3, 8, '2020-08-10 23:48:35'),
(11, 3, 2, '2020-08-10 23:49:35'),
(12, 3, 3, '2020-08-10 23:50:35'),
(13, 3, 1, '2020-08-10 23:51:35'),
(14, 4, 3, '2020-08-10 23:52:35'),
(15, 4, 1, '2020-08-10 23:53:35'),
(16, 4, 2, '2020-08-10 23:54:35'),
(17, 4, 9, '2020-08-10 23:55:35');

-- --------------------------------------------------------

--
-- Структура для представления `getLastProducts`
--
DROP TABLE IF EXISTS `getLastProducts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getLastProducts`  AS  select `users`.`name` AS `user_name`,`products`.`name` AS `product_name`,`products`.`price` AS `product_price`,`products`.`created` AS `product_created_at` from (((((select `users_product`.`user_id` AS `user_id`,max(`users_product`.`id`) AS `max_id` from `users_product` group by `users_product`.`user_id`)) `T` left join `users_product` on((`users_product`.`id` = `T`.`max_id`))) left join `products` on((`users_product`.`product_id` = `products`.`id`))) left join `users` on((`users_product`.`user_id` = `users`.`id`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `users_product`
--
ALTER TABLE `users_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users_product`
--
ALTER TABLE `users_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users_product`
--
ALTER TABLE `users_product`
  ADD CONSTRAINT `users_product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
