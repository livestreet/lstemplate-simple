<?php
/*-------------------------------------------------------
*
*   LiveStreet Engine Social Networking
*   Copyright © 2008 Mzhelskiy Maxim
*
*--------------------------------------------------------
*
*   Official site: www.livestreet.ru
*   Contact e-mail: rus.engine@gmail.com
*
*   GNU General Public License, version 2:
*   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
*
---------------------------------------------------------
*/

/**
 * Настройки
 */
Config::Set('module.topic.per_page',9);	// Число топиков на одну страницу
$config['count_top_users']   = 10;  // Число пользователей в верхнем ТОП
$config['count_top_topics']   = 6;  // Число топиков в верхнем ТОП-слайдере, лучше указывать четное число
$config['topic_time_top']   = 60*60*24*7*10*10;  // Число секунд за которые считать ТОП топиков, по дефолту стоит 7 дней
$config['count_profile_topics']   = 6;  // Число топиков на странице профиля пользователя
$config['count_profile_comments']   = 10;  // Число комментов на странице профиля пользователя
$config['show_thumbs_only_index']   = true;  // Показывать топики в виде превью только на главной странице, если сделать false - то будут на всех страницах
$config['show_titletwo']   = false;  // Показывать заголовок в две строки

$config['preview_size_w']=208;	// Ширина
$config['preview_size_h']=116;	// Высота, при crop=false используется как минимально возможная высота
$config['preview_crop']=true;	// Делать из картинки кроп? false - если не нужно обрезать картинки по высоте
$config['preview_big_size_w']=317;	// Ширина большого варианта
$config['preview_big_size_h']=186;	// Высота большого варианта, при crop=false используется как минимально возможная высота
$config['preview_big_crop']=true;	// Делать из картинки кроп для большого варианта? false - если не нужно обрезать картинки по высоте


/***************************************************************************************************
 ********************************          НИЖЕ НЕ ТРОГАТЬ!         ********************************
 ***************************************************************************************************
 */

$config['size_images_preview']=array(
	array(
		'w' => $config['preview_size_w'],
		'h' => $config['preview_crop'] ? $config['preview_size_h'] : null,
		'crop' => $config['preview_crop'],
	),
	array(
		'w' => $config['preview_big_size_w'],
		'h' => $config['preview_big_crop'] ? $config['preview_big_size_h'] : null,
		'crop' => $config['preview_big_crop'],
	)
);

/**
 *  Список размеров превью, которые необходимо делать при загрузке фото
 */
/*
$config['size_images']=array(
  array(
    'w' => 208,
    'h' => 116,
    'crop' => true,
  ),
  array(
    'w' => 317,
    'h' => 186,
    'crop' => true,
  )
);
*/
/**
 * Список размеров превью топика
 * По умолчанию наследуется от $config['size_images'], но можно добавить и свои размеры, например 100х100
 */
/*
$config['size_images_review']=array_merge(array(
                   ),$config['size_images']);
*/
//Config::Set('module.topic.photoset.size',array_merge(Config::Get('module.topic.photoset.size'),$config['size_images']));

return $config;
?>