<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/** @var $message string */
/* @var $model chabibnr\events\models\events */

$this->title = 'Create Events';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="events-create">

    <h1><?= Html::encode($this->title) ?></h1>
    <?=\yii\bootstrap\Alert::widget([
        'body' => $message
    ])?>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
