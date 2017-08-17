<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model chabibnr\events\models\events */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="events-view">

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <h1><?= Html::encode($this->title) ?></h1>
<div class="row">
    <div class="col-md-5">

        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [
                //'id',
                //'slug',
                'title',
                'description:html',
                [
                    'attribute' => 'date_start',
                    'value' => function($model){
                        return Yii::$app->formatter->asDate($model->date_start, 'php:d F Y H:i a');
                    }
                ],
                [
                    'attribute' => 'date_end',
                    'value' => function($model){
                        return Yii::$app->formatter->asDate($model->date_end, 'php:d F Y H:i a');
                    }
                ],
                'location',
                'city',
                'address:ntext',
            ],
        ]) ?>
        <h3>Narasumber</h3>
        <?php
        foreach($model->speakers as $speaker){
            echo DetailView::widget([
                'model' => $speaker,
                'attributes' => [
                    'name',
                    'description'
                ]
            ]);
        }
        ?>
    </div>
    <div class="col-md-7">
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
