<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 8/12/2017
 * Time: 3:02 PM
 */

namespace chabibnr\events\controllers;
use Yii;
use chabibnr\events\models\events;
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

        return $this->render('../main/index', [
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
        return $this->render('../main/view', [
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
            return $this->render('../main/create', [
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
            return $this->render('../main/update', [
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

    /**
     * Finds the events model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return events the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = events::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}