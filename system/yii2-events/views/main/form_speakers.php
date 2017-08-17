<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model chabibnr\events\models\EventsSpeakers */
/* @var $form ActiveForm */
$this->title = 'Speakers: ';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Speaker';
?>
<div class="site-form">
    <h1><?= Html::encode('Form Speaker') ?></h1>
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'events_id')->hiddenInput()->label(false) ?>
    <?= $form->field($model, 'name') ?>
    <?= $form->field($model, 'photo')->textInput(['placeholder' => 'Url Gambar']) ?>
    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div><!-- site-form -->