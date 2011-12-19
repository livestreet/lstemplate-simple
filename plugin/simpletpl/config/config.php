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

Config::Set('router.page.simpletpl', 'PluginSimpletpl_ActionSimple');

/**
 * Настройки
 */
$config['count_top_users']   = 10;  // Число пользователей в верхнем ТОП
$config['count_top_topics']   = 6;  // Число топиков в верхнем ТОП-слайдере, лучше указывать четное число
$config['topic_time_top']   = 60*60*24*7*10;  // Число секунд за которые считать ТОП топиков, по дефолту стоит 7 дней
$config['count_profile_topics']   = 6;  // Число топиков на странице профиля пользователя
$config['count_profile_comments']   = 10;  // Число комментов на странице профиля пользователя

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

return $config;
?>