<?php

namespace chabibnr\events\controllers;

use Yii;
use chabibnr\events\models\events;
use chabibnr\events\models\EventsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DefaultController implements the CRUD actions for events model.
 */
class DefaultController extends Controller
{

    use ControllerTrait;
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        $actions = Yii::$app->controller->module->actions;
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => isset($actions['default']) ? $actions['default'] : [],
            ],
        ];
    }
}
