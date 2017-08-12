<?php

namespace chabibnr\events;

/**
 * This is just an example.
 */
class Module extends \yii\base\Module
{
    public $controllerNamespace = 'chabibnr\events\controllers';
    public $userModel = '';
    public $actions = [];
    public  $pathView = '';

    function __construct($id, $parent = null, array $config = [])
    {
        parent::__construct($id, $parent, $config);
        $this->viewPath = empty($this->pathView) ? $this->viewPath : $this->pathView;
    }
}
