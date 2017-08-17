<?php

namespace chabibnr\events\controllers;

use chabibnr\events\components\actions\events\IndexAction;
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

    public function actions()
    {
        return [
            'tesindex' => IndexAction::className()
        ];
    }

    use ControllerTrait;
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        $actions = Yii::$app->controller->module->actions;
        $myActions = isset($actions['default']) ? $actions['default'] : [];

        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => isset($actions['default']) ? $actions['default'] : [],
            ],
        ];
    }
}
