<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace console\controllers;

use Yii;
use yii\console\Controller;

/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class HelloController extends Controller
{
    /**
     * This command echoes what you have entered as the message.
     * @param string $message the message to be echoed.
     */
    public function actionIndex($message = 'hello world')
    {
        echo $message . "\n";
    }

    public function actionTest() {
	Yii::$app->mailer->compose()
    		->setFrom('admin@yiiframework.id')
    		->setTo('chabibnurozak@gmail.com')
    		->setSubject('Message subject')
    		->setTextBody('Plain text content')
    		//->setHtmlBody('<b>HTML content</b>')
    		->send();

    }
}

