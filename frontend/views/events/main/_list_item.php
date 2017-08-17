<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/12/17
 * Time: 6:00 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 * @var \chabibnr\events\models\Events $model
 */

use yii\helpers\Url;

?>
    <div class="twPc-div">
        <div class="twPc-bg twPc-block"
             style="text-align: center; line-height: 1; font-weight: 300; font-size: 20px; color: #fff; padding: 10px">
            <?= $model->title ?>
        </div>

        <div style="padding: 5px 10px;">
            <div class="twPc-button">
                <a href="<?= Url::toRoute(['view', 'id' => $model->slug]) ?>" class="btn btn-primary">Detail
                    Acara</a>
            </div>

            <div class="twPc-divUser" style="padding-top: 25px; font-size: 15px; padding-bottom: 0;text-align: center">
                <?= $model->location ?>
            </div>

            <div class="twPc-divStats">
                <ul class="twPc-Arrange">
                    <li class="twPc-ArrangeSizeFit">
                        <a href="#" title="<?= Yii::$app->formatter->asDate($model->date_start) ?>">
                            <span class="twPc-StatLabel twPc-block"><?= Yii::$app->formatter->asDate($model->date_start, 'php:M Y') ?></span>
                            <span class="twPc-StatValue"><?= Yii::$app->formatter->asDate($model->date_start, 'd') ?></span>
                        </a>
                    </li>
                    <li class="twPc-ArrangeSizeFit">
                        <a href="#" title="Mulai">
                            <span class="twPc-StatLabel twPc-block">Jam</span>
                            <span class="twPc-StatValue"><?= Yii::$app->formatter->asTime($model->date_start) ?></span>
                        </a>
                    </li>
                    <li class="twPc-ArrangeSizeFit">
                        <a href="#" title="Maksimal Peserta : <?= $model->max_participant ?>">
                            <span class="twPc-StatLabel twPc-block">Peserta</span>
                            <span class="twPc-StatValue"><?= $model->max_participant ?></span>
                        </a>
                    </li>
                    <li class="twPc-ArrangeSizeFit">
                        <a href="#" title="<?= $model->statusText ?>">
                            <span class="twPc-StatLabel twPc-block">Status</span>
                            <span class="twPc-StatValue"><?= $model->statusText ?></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
<?php

/**
 * End of File : _list_item.php
 *
 */