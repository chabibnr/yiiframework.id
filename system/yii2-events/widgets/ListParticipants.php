<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/13/17
 * Time: 10:09 AM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\widgets;

use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use chabibnr\events\models\EventsParticipantsSearch;
use yii\grid\GridView;

class ListParticipants extends Widget
{
    public $eventId;
    public $columns = [
        ['class' => 'yii\grid\SerialColumn'],

        'user_id',
        'date_register:date',
        'date_confirm:date',
        // 'status',
    ];

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $searchModel = new EventsParticipantsSearch();
        $searchModel->events_id = $this->eventId;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return GridView::widget([
            'dataProvider' => $dataProvider,
            //'filterModel' => $searchModel,
            'columns' => $this->columns,
        ]);
    }
}

/**
 * End of File : ListParticipants.php
 *
 */