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
 * Настройки для шаблона.
 */

// Модуль Topic
$config['module']['topic']['per_page']   = 9;          // Число топиков на одну страницу

/**
 * Настройка топика-фотосета
 */
$config['module']['image']['photoset']['jpg_quality'] = 100; // настройка модуля Image, качество обработки фото
$config['module']['topic']['photoset']['photo_max_size'] = 6*1024; //kb  // максимально допустимый размер фото
$config['module']['topic']['photoset']['count_photos_min'] = 2; // минимальное количество фоток
$config['module']['topic']['photoset']['count_photos_max'] = 30; // максимальное количество фоток
$config['module']['topic']['photoset']['per_page'] = 20; // число фоток для одновременной загрузки
$config['module']['topic']['photoset']['size'] = array( // список размеров превью, которые необходимо делать при загрузке фото
	array(
		'w' => 1000,
		'h' => null,
		'crop' => false,
	),
	array(
		'w' => 500,
		'h' => null,
		'crop' => false,
	),
	array(
		'w' => 100,
		'h' => 65,
		'crop' => true,
	),
	array(
		'w' => 50,
		'h' => 50,
		'crop' => true,
	),
	array(
		'w' => 332,
		'h' => 249,
		'crop' => true,
	)
);
return $config;
?>