<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use chabibnr\events\models\Events;
use chabibnr\events\models\EventsParticipants;

/* @var $this yii\web\View */
/* @var $model chabibnr\events\models\events */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = "Detail";
$userLoggedJoin = \chabibnr\events\models\EventsParticipants::findOne([
    'user_id' => Yii::$app->user->id,
    'events_id' => $model->id
]);
$msg = '';
$open = '';
if($model->status == Events::STATUS_OPEN){
    $msg = 'Acara ini masih terbuka, ikuti dan ';
} elseif($model->status == Events::STATUS_CLOSE){
    $msg = 'Acara ini telah ditutup untuk pendaftaran';
} elseif($model->status == Events::STATUS_ONGOING){
    $msg = 'Acara ini sedang berlangsung';
} elseif($model->status == Events::STATUS_END){
    $open = 'alert-primary';
    $msg = "Acara ini telah selesai";
}

$style = <<<CSS
.event-detail dl dt{
    border-bottom: #ccc;
    border-bottom-width: 1px;
    border-bottom-style: dashed;
}
CSS;
$this->registerCss($style);
?>
<div class="events-view" style=" font-weight: 300">
    <h3>Pembicara</h3>
    <div class="row">
        <?php foreach($model->speakers as $speaker):?>
        <div class="col-md-3">
            <div class="span3 well">
                <div class="text-center">
                    <a href="#" data-toggle="modal"><img src="<?=$speaker->photo?>" name="<?=$speaker->name?>" width="140" height="140" class="img-circle"></a>
                    <h4 style="font-weight: 300"><?=$speaker->name?></h4>
                    <em><?=$speaker->description?></em>
               </div>
            </div>
        </div>
        <?php endforeach;?>
    </div>
    </div>
    <div class="row">
        <div class="col-md-5 event-detail" style="font-size: 18px;">
            <dl>
                <dt>Acara</dt>
                <dd><?= $model->title ?></dd>
            </dl>
            <dl>
                <dt>Tempat</dt>
                <dd>
                    <?= $model->location ?> - <?= $model->city ?><br/>
                    <em><?= $model->address ?></em>
                </dd>
            </dl>
            <dl>
                <dt>Waktu</dt>
                <dd>
                    <?= Yii::$app->formatter->asDatetime($model->date_start, 'php:d F Y H:i a') ?> -
                    <?php
                    $format = (date('Y-m-d', strtotime($model->date_start)) === date('Y-m-d', strtotime($model->date_end))) ? '' : 'd F Y ';
                    echo Yii::$app->formatter->asDatetime($model->date_end, "php:{$format}H:i a");
                    ?>
                </dd>
            </dl>
            <dl>
                <dt>Deskripsi</dt>
                <dd>
                    <?=$model->description?>
                </dd>
            </dl>
        </div>
        <div class="col-md-7">
            <div class="clearfix">
                <h3 class="pull-left">Peserta</h3>
                <div class="pull-right">
                    <?php
                    if($userLoggedJoin == null) {
                        echo Html::a('Ikuti acara ini', ['invite-user', 'id' => $model->slug], [
                            'class' => 'btn btn-info',
                            'style' => 'margin-top: 25px'
                        ]);
                    } elseif($userLoggedJoin && $model->status == Events::STATUS_CONFIRM && $userLoggedJoin->status != EventsParticipants::STATUS_CONFIRM) {
                        echo Html::a('Konfiramsi Kehadiran', ['confirm-user', 'id' => $model->slug], [
                            'class' => 'btn btn-primary',
                            'style' => 'margin-top: 25px'
                        ]);
                    }
                    if($userLoggedJoin != null && in_array($model->status,[Events::STATUS_OPEN, Events::STATUS_CONFIRM])) {
                        echo Html::a('Batalkan', ['cancel-user', 'id' => $model->slug], [
                            'class' => 'btn btn-danger',
                            'style' => 'margin-top: 25px; margin-left: 10px'
                        ]);
                    }
                    ?>
                </div>
            </div>

            <?= \chabibnr\events\widgets\ListParticipants::widget([
                'eventId' => $model->id,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
                    [
                        'label' => 'User',
                        'attribute' => 'user_id',
                        'value' => function($model){
                            return (!empty($model->user->first_name)) ? $model->user->first_name .' '.$model->user->last_name : $model->user->username;
                        }
                    ],
                    [
                        'label' => 'Registrasi',
                        'attribute' => 'date_register',
                        'format' => 'date'
                    ],
                    [
                        'label' => 'Konfirmasi',
                        'attribute' => 'date_confirm',
                        'value' => function($model){
                            return $model->date_confirm == 0 ? '-' : Yii::$app->formatter->asDate($model->date_confirm);
                        }
                    ],
                    [
                        'attribute' => 'status',
                        'value' => function($model){
                            return $model->statusText;
                        }
                    ],
                ]
            ]) ?>
        </div>
    </div>


</div>
