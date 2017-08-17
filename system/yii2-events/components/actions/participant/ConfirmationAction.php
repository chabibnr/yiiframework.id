<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/16/17
 * Time: 8:53 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\components\actions\participant;

use chabibnr\events\components\actions\Action;
use Yii;
use yii\web\NotFoundHttpException;
use chabibnr\events\models\Events;
use chabibnr\events\models\EventsParticipants;

class ConfirmationAction extends Action
{
    public function run($id)
    {

        $slug = !is_numeric($id)? $id: 0;
        $getEvent = $this->findModel($slug);
        if($getEvent->status == Events::STATUS_CONFIRM){
            $user = Yii::$app->user->id;
            $isJoin = EventsParticipants::findOne(['user_id' => $user]);
            if($isJoin != false){
                $isJoin->date_confirm = date('U');
                $isJoin->status = EventsParticipants::STATUS_CONFIRM;
                $isJoin->save();
            }
        }
        $this->controller->redirect(['view','id' => $getEvent->slug]);
    }

    /**
     * Finds the events model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer|string $id
     * @return Events the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $filter = is_numeric($id) ?['id' => $id] : ['slug' => $id];
        if (($model = Events::findOne($filter)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

/**
 * End of File : ConfirmationAction.php
 *
 */