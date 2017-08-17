<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 8/12/2017
 * Time: 3:02 PM
 */

namespace chabibnr\events\controllers;
use chabibnr\events\models\EventsParticipants;
use chabibnr\events\models\EventsSpeakers;
use Yii;
use chabibnr\events\models\Events;
use chabibnr\events\models\EventsSearch;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

trait ControllerTrait
{

    /**
     * Lists all events models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new EventsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('/main/index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single events model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('/main/view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new events model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Events();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('/main/create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing events model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('/main/update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing events model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionInviteUser($id){
        $slug = !is_numeric($id)? $id: 0;
        $getEvent = $this->findModel($slug);
        if($getEvent->status == Events::STATUS_OPEN){
            $user = Yii::$app->user->id;
            $isJoin = EventsParticipants::findOne(['user_id' => $user]);
            if($isJoin == false){
                $model = new EventsParticipants();
                $model->user_id = Yii::$app->user->id;
                $model->events_id = $getEvent->id;
                $model->date_register = date('U');
                $model->status = EventsParticipants::STATUS_JOIN;
                $model->save();
            }
        }
        $this->redirect(['/'. $this->module->id.'/default/view','id' => $getEvent->slug]);
    }

    public function actionConfirmUser($id){
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
        $this->redirect(['/'. $this->module->id.'/default/view','id' => $getEvent->slug]);
    }

    public function actionSpeakers($events,$id = ''){
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
            $this->redirect(['view', 'id' => $model->events_id]);
        }

        return $this->render('/main/form_speakers',[
            'model' => $model
        ]);
    }

    /**
     * Finds the events model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer|string $id
     * @return events the loaded model
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