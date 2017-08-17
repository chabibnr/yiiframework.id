<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/16/17
 * Time: 9:09 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\components\actions;


class Action extends \yii\base\Action
{
    public $viewPath='@chabibnr/events/views';

    public function init()
    {
        $this->controller->setViewPath($this->viewPath);
    }
}

/**
 * End of File : Action.php
 *
 */