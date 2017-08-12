<?php

use yii\helpers\Html;
use yii\grid\GridView;

/**
 * @author : Chabib Nurozak <chabibnurozak@gmail.com>
 * @website: chabibnr.net
 * @created: 8/12/2017
 * @file   : index.php
 * @var $this yii\web\View
 * @var $searchModel chabibnr\events\models\EventsSearch
 * @var $dataProvider yii\data\ActiveDataProvider
 *
 */

$this->title = 'Events';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="events-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'slug',
            'title',
            'description:ntext',
            'date',
            // 'location',
            // 'address:ntext',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
