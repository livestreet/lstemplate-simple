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
 * Адрес конвертера фото-сетов
 */
Config::Set('router.page.simpletpl', 'PluginSimpletpl_ActionSimple');

/**
 * Настройки
 */
$config['count_top_users']   = 10;  // Число пользователей в верхнем ТОП
$config['count_top_topics']   = 6;  // Число топиков в верхнем ТОП-слайдере, лучше указывать четное число
$config['topic_time_top']   = 60*60*24*7*10;  // Число секунд за которые считать ТОП топиков, по дефолту стоит 7 дней
$config['count_profile_topics']   = 6;  // Число топиков на странице профиля пользователя
$config['count_profile_comments']   = 10;  // Число комментов на странице профиля пользователя
$config['make_preview_video']   = true;  // Создавать или нет автоматические превью топика на основе вставленного в текст видео

/**
 *  Список размеров превью, которые необходимо делать при загрузке фото
 */
$config['size_images']=array(
	array(
		'w' => 229,
		'h' => 116,
		'crop' => true,
	),
	array(
		'w' => 354,
		'h' => 186,
		'crop' => true,
	)
);
/**
 * Список размеров превью топика
 * По умолчанию наследуется от $config['size_images'], но можно добавить и свои размеры, например 100х100
 */
$config['size_images_review']=array_merge(array(
								/*
								  array(
									  'w' => 100,
									  'h' => 100,
									  'crop' => true,
								  ),
								*/
								   ),$config['size_images']);

Config::Set('module.topic.photoset.size',array_merge(Config::Get('module.topic.photoset.size'),$config['size_images']));

return $config;
?>