<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/16/17
 * Time: 8:53 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\components\actions\speaker;

use chabibnr\events\components\actions\Action;
use Yii;
use yii\web\NotFoundHttpException;
use chabibnr\events\models\EventsSpeakers;

class FormAction extends Action
{
    public function run($events,$id ='')
    {
        if(empty($id)){
            $model = new EventsSpeakers();
            $model->events_id = $events;
        } else {
            $model = EventsSpeakers::findOne(['id' => $id, 'events_id' => $events]);
            if($model == null){
                throw new NotFoundHttpException("Halaman tidak tersedia");
            }
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $this->controller->redirect(['view', 'id' => $model->events_id]);
        }

        return $this->controller->render('main/form_speakers',[
            'model' => $model
        ]);
    }
}

/**
 * End of File : FormAction.php
 *
 */