<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\datetime\DateTimePicker;
use chabibnr\events\models\Events;

/* @var $this yii\web\View */
/* @var $model chabibnr\events\models\Events */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="events-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'date_start')->widget(DateTimePicker::className(),[
        'options' => [
            'placeholder' => 'Waktu Mulai',
            'value'  => Yii::$app->formatter->asDate($model->date_start ?: date('Y-m-d H:i'),'php:Y-m-d H:i')
        ],
        'convertFormat' => true,
        'pluginOptions' => [
            'format' => 'yyyy-MM-dd H:i',
            'todayHighlight' => true,
        ]
    ]) ?>


    <?= $form->field($model, 'date_end')->widget(DateTimePicker::className(),[
        'options' => [
            'placeholder' => 'Waktu Selesai',
            'value'  => Yii::$app->formatter->asDate($model->date_end ?: date('Y-m-d H:i'),'php:Y-m-d H:i')
        ],
        'convertFormat' => true,
        'pluginOptions' => [
            'format' => 'yyyy-MM-dd H:i',
            'todayHighlight' => true,
        ]
    ]) ?>

    <?= $form->field($model, 'location')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'max_participant')->textInput() ?>
    <?= $form->field($model, 'status')->dropDownList($model->allStatus) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
