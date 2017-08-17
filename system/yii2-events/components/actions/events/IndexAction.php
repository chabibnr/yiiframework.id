<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/16/17
 * Time: 8:53 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\components\actions\events;

use chabibnr\events\components\actions\Action;
use Yii;
use chabibnr\events\models\EventsSearch;

class IndexAction extends Action
{
    public function run()
    {
        $searchModel = new EventsSearch();

        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->controller->render('main/index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}

/**
 * End of File : IndexAction.php
 *
 */