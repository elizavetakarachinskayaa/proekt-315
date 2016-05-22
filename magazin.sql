-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 19 2016 г., 16:55
-- Версия сервера: 5.5.25
-- Версия PHP: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `magazin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gorod`
--

CREATE TABLE IF NOT EXISTS `gorod` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID goroda` int(10) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `telefon` char(12) NOT NULL,
  `proezd` varchar(255) NOT NULL,
  `opisanie` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`,`ID goroda`,`adres`,`telefon`,`proezd`,`opisanie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `gorod`
--

INSERT INTO `gorod` (`ID`, `ID goroda`, `adres`, `telefon`, `proezd`, `opisanie`) VALUES
(1, 1, 'Санкт-Петербург, Разъезжая, 42', '89123456789', 'Метро «Владимирская».Выйти из метро.Повернуть направо на Кузнечный переулок и пройти до пересечения с ул. Марата.Повернуть направо и пройти по ул. Марата до пересечения с ул. Разъезжая. Повернуть налево. Через 70 метров - магазин «Женские штучки».', 'Огромный выбор товаров'),
(2, 2, 'Москва ул. Ленинская Слобода, 19', '89213457656', 'м. Автозаводская, ул. Ленинская Слобода, д.19, Бизнес Центр «Омега Плаза», 2 этаж  налево, офис сети магазинов "Женские штучки" ', 'Огромный выбор товаров по низким ценам'),
(3, 3, 'Ярославль,  ул Чкалова, 14', '89603452113', 'Выйти к магазину «Марьинский Пассаж». Сесть на бесплатный автобус, следующий до ТЦ «Вегас». Интервал движения автобуса 45 мин., буд. 9:00-23:30, вых. 9:30-00:15.45 мин., буд. 9:00-23:30, вых. 9:30-00:15. Внутри ТЦ: 3й вход, 1 этаж, рядом с магазином МТС', 'Самые низкие цены в сети магазинах "Женские штучки"');

-- --------------------------------------------------------

--
-- Структура таблицы `kategorii_gorodov`
--

CREATE TABLE IF NOT EXISTS `kategorii_gorodov` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `gorod` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`,`gorod`,`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `kategorii_gorodov`
--

INSERT INTO `kategorii_gorodov` (`ID`, `gorod`, `url`) VALUES
(1, 'Санкт-Петебург', 'SaintPetersburg'),
(2, 'Москва', 'Moscow'),
(3, 'Ярославль', 'Yaroslavl');

-- --------------------------------------------------------

--
-- Структура таблицы `kategorii_tovarov`
--

CREATE TABLE IF NOT EXISTS `kategorii_tovarov` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`,`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `kategorii_tovarov`
--

INSERT INTO `kategorii_tovarov` (`ID`, `name`, `url`) VALUES
(1, 'Духи', 'duxi'),
(2, 'Пудра', 'pudra'),
(3, 'Румяна', 'rumayna'),
(4, 'Тональное средства', 'tonalnoe_sredstvo'),
(5, 'Корректор', 'korrektor'),
(6, 'Тени', 'teni'),
(7, 'Тушь', 'tush'),
(8, 'Карандаш и лайнеры', 'karandach_lainer'),
(9, 'Для бровей', 'dlay_brovei'),
(10, 'Блеск для губ', 'blesk_gub'),
(11, 'Помада', 'pomada'),
(12, 'Карандаш для губ', 'karandash_gub'),
(13, 'Дизайн ногтей', 'dizain_nogtei'),
(14, 'Лак для ногтей', 'lak_nogti'),
(15, 'Уход за ногтями', 'yxod_nogti'),
(16, 'Средства для снятия лака', 'snaytie_laka'),
(17, 'Пилочки для ногтей', 'piloshki_nogti'),
(18, 'Лак для волос', 'lak_voloci'),
(19, 'Аксессуары для волос', 'aksessyari_voloci'),
(20, 'Окрашивание ', 'okrachivanie');

-- --------------------------------------------------------

--
-- Структура таблицы `tovar`
--

CREATE TABLE IF NOT EXISTS `tovar` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID kategorii` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `kolichestvo` int(10) NOT NULL,
  `opisanie` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Дамп данных таблицы `tovar`
--

INSERT INTO `tovar` (`ID`, `ID kategorii`, `name`, `price`, `kolichestvo`, `opisanie`) VALUES
(1, 1, 'Парфюмерная вода VERSACE BRIGHT CRYSTAL ABSOLU', 3050, 100, 'VERSACE представляет новый аромат BRIGHT CRYSTAL ABSOLU - чистая чувственность, кристальная прозрачность и сияние.'),
(2, 1, 'ПАРФЮМЕРНАЯ ВОДА TRUSSARDI MY NAME', 2850, 100, 'Чувственный женский аромат TRUSSARDI MY NAME нотами белой фиалки и сирени, в сочетании с ванилью отражает соблазнительную, уверенную в себе женщину.'),
(3, 1, 'ПАРФЮМЕРНАЯ ВОДА ALAN BRAY ВЫСШИЙ СВЕТ ECLAT D ETOILE', 625, 50, 'Аромат открывается свежим  аккордом мандарина в обрамлении жасмина, розы, орхидеи и ландыша, подчеркнутых прелестным ежевично-мускусным шлейфом'),
(4, 2, 'ПУДРА КОМПАКТНАЯ ДЛЯ ЛИЦА CATRICE PRIME AND FINE MATTIFYING ВЛАГОСТОЙКАЯ МАТИРУЮЩАЯ', 655, 23, 'Влагостойкая матирующая пудра PRIME AND FINE MATTIFYING'),
(5, 2, 'КРЕМ-ПУДРА ДЛЯ ЛИЦА ARTDECO DOUBLE FINISH', 1250, 200, 'Функциональная тональная основа, сочетающая тональный крем и пудру  – лучшее средство для мгновенного преображения кожи!'),
(6, 3, 'РУМЯНА ARTDECO', 345, 13, 'Широкая палитра оттенков и  возможность индивидуально скомбинировать палитру'),
(7, 3, 'РУМЯНА BOURJOIS BLUSH', 790, 200, 'Шелковая текстура румян при соприкосновении с кожей превращается в легкую, бархатистую пудру.'),
(8, 4, 'ОСНОВА ТОНАЛЬНАЯ ДЛЯ ЛИЦА MAX FACTOR FACEFINITY ALL DAY FLAWLESS 3 В 1', 1000, 245, 'Тональная основа MAX FACTOR FACEFINITY ALL DAY FLAWLESS 3 в 1 с основой, корректором и SPF 20 .'),
(9, 4, 'КРЕМ ТОНАЛЬНЫЙ ДЛЯ ЛИЦА BOURJOIS CC CREAM ТОН 32 УХАЖИВАЮЩИЙ', 450, 345, ' CC CREAM'),
(10, 5, 'КОНСИЛЕР ДЛЯ ЛИЦА ARTDECO PERFECT TEINT CONCEALER МАСКИРУЮЩИЙ С КИСТОЧКОЙ', 790, 23, 'Светоотражающие частицы консилера Perfect Teint ARTDECO Concealet скрывают недостатки кожи и мелкие морщинки. Консилер придает лицу свежесть и выравнивает тон.'),
(11, 6, 'ТЕНИ ДЛЯ ВЕК CATRICE LIQUID METAL ОДИНАРНЫЕ С ЭФФЕКТОМ МЕТАЛЛИК', 2300, 345, 'Тени с повышенной пигментацией для экстраординарного металлического блеска.'),
(12, 7, 'ТУШЬ ДЛЯ РЕСНИЦ ARTDECO ART COUTURE LASH DESIGNER ОБЪЕМ, ПОДКРУЧИВАНИЕ И УДЛИНЕНИЕ (ЧЕРНАЯ)', 2400, 456, 'Создатели кисточки вдохновлялись идеальными женскими формами 90-60-90'),
(13, 8, 'ПОДВОДКА-ЛАЙНЕР ДЛЯ ГЛАЗ ARTDECO HIGH PRECISION (КОРИЧНЕВАЯ)', 997, 21, 'Лайнер высокой точности! Нанеси от внутреннего уголка глаза к внешнему вдоль роста ресниц. Для более широкой линии чуть сильнее надави на лайнер.'),
(14, 9, 'КАРАНДАШ ДЛЯ БРОВЕЙ CATRICE EYEBROW STYLIST С ЩЕТОЧКОЙ', 599, 91, 'Карандаш для бровей CATRICE EYEBROW STYLIST с профессиональной щеточкой для растушевывания.'),
(15, 9, 'ГЕЛЬ ДЛЯ БРОВЕЙ CATRICE EYEBROW FILLER', 544, 75, 'Гель для придания формы бровям от CATRICE подчеркивает изгиб бровей и заполняет небольшие пробелы.'),
(16, 10, 'БЛЕСК ДЛЯ ГУБ MAX FACTOR COLOUR ELIXIR GLOSS ', 1400, 400, 'ТОН 40'),
(17, 11, 'ПОМАДА ДЛЯ ГУБ LOREAL COLOR RICHE COLLECTION PRIVEE JULIANNES NUDE', 999, 11, 'ПОМАДА ДЛЯ ГУБ'),
(18, 12, 'КАРАНДАШ ДЛЯ ГУБ VIVIENNE SABO JOLIES LEVRES', 766, 15, 'Карандаш для губ VIVIENNE SABO JOLIES LEVRES мягко очерчивает контур губ, не растекается, подходит к любой помаде или блеску – да и сам по себе хорош.'),
(19, 13, 'НАКЛЕЙКИ ДЛЯ НОГТЕЙ GLOSSYBLOSSOM PREMIUM LOOK 2 В 1', 500, 100, 'ЗОЛОТЫЕ КРУПИНКИ 3D'),
(20, 14, 'ЛАК ДЛЯ НОГТЕЙ LAQ ', 195, 222, 'ТОН 10263 15 МЛ'),
(21, 14, 'ЛАК ДЛЯ НОГТЕЙ PINK UP BIRDS OF HEAVEN', 450, 150, 'ТОН 20 15 МЛ'),
(22, 15, 'СРЕДСТВО ДЛЯ РОСТА НОГТЕЙ ESSENCE STUDIO NAILS 8 МЛ', 390, 400, 'Усилитель роста ногтей studio nails growth booster гарантирует потрясающий эффект.'),
(23, 15, 'СРЕДСТВО ДЛЯ РЕГЕНЕРАЦИИ НОГТЕЙ EVELINE ЗДОРОВЫЕ НОГТИ 8 В ', 600, 100, 'ЗОЛОТОЙ БЛЕСК 12 МЛ'),
(24, 16, 'ЖИДКОСТЬ ЛАСКА Д/СНЯТИЯ ЛАКА Б/А В ПЛ. ФЛ', 59, 900, '100МЛ 073-027'),
(25, 16, 'ЖИДКОСТЬ ДЛЯ СНЯТИЯ ЛАКА OPI EXPERT TOUCH LACQUER REMOVER', 490, 340, '30 МЛ'),
(26, 17, 'НАБОР ПИЛОЧЕК ДЛЯ НОГТЕЙ QVS ', 700, 300, 'В ФУТЛЯРЕ 2 ШТ'),
(27, 17, 'ПИЛКА QVS', 670, 500, 'ШЛИФОВАЛЬНАЯ ДЛЯ ПЕДИКЮРА ДВУСТОРОННЯЯ'),
(28, 18, 'ЛАК ДЛЯ ВОЛОС SCHWARZKOPF PROFESSIONAL OSIS ', 790, 400, 'СИЛЬНАЯ ФИКСАЦИЯ 300 МЛ'),
(29, 18, 'ЛАК ДЛЯ ВОЛОС STYLISTE ULTIME FLEX CONTROL С КОМПЛЕКСОМ ELASTIN', 395, 500, 'СИЛЬНОЙ ФИКСАЦИИ 300 МЛ'),
(30, 19, 'НАБОР РЕЗИНОК LADY PINK', 95, 900, 'Укроти буйный нрав своих волос! Резинки-пружинки от Lady Pink не заламывают волосы и превосходно держат прическу!'),
(31, 19, 'АКСЕССУАР ДЛЯ ВОЛОС LADY PINK', 900, 600, 'Хорошо держит волосы'),
(32, 20, 'КРАСКА ДЛЯ ВОЛОС GARNIER COLOR & SHINE', 700, 300, 'ТОН 5.5 (КРАСНОЕ ДЕРЕВО)'),
(33, 20, 'КРАСКА ДЛЯ ВОЛОС SYOSS MIXING COLORS', 7000, 400, 'ТОН 1-18 (ГОРЬКИЙ ШОКОЛАД МИКС) 60 МЛ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
