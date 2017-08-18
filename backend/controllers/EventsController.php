<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/16/17
 * Time: 9:05 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace backend\controllers;


use chabibnr\events\components\actions\participant\CancelAction;
use chabibnr\events\components\actions\participant\ConfirmationAction;
use chabibnr\events\components\actions\events\CreateAction;
use chabibnr\events\components\actions\events\DeleteAction;
use chabibnr\events\components\actions\participant\InviteUserAction;
use chabibnr\events\components\actions\speaker\FormAction as FormSpeakerAction;
use chabibnr\events\components\actions\events\UpdateAction;
use chabibnr\events\components\actions\events\ViewAction;
use yeesoft\controllers\admin\DashboardController;
use chabibnr\events\components\actions\events\IndexAction;

class EventsController extends DashboardController
{
    public $userModel = 'yeesoft\models\User';
    public $defaultAction = 'index';
    function actions()
    {
        parent::actions();
        return [
            'index' => [
                'class' => IndexAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'lihat' => [
                'class' => ViewAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'buat' => [
                'class' => CreateAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'perbarui' => [
                'class' => UpdateAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'hapus' => [
                'class' => DeleteAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'invite-user' => [
                'class' => InviteUserAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'confirm-user' => [
                'class' => ConfirmationAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'cancel-user' => [
                'class' => CancelAction::className(),
                //'viewPath' => '@frontend/views/events'
            ],
            'speakers' => [
                'class' => FormSpeakerAction::className(),
                //'viewPath' => '@frontend/views/events'
            ]
        ];


    }
}

/**
 * End of File : EventsController.php
 *
 */