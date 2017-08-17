<?php
namespace chabibnr\events\models;

use Yii;
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/13/17
 * Time: 9:52 AM
 * Version: 1.0
 * Website: https://chabibnr.net
 * This is the model class for table "chabibnr_events_participants".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $events_id
 * @property integer $date_register
 * @property integer $date_confirm
 * @property integer $status
 *
 * @property Events $events
 * @property array $allStatus
 * @property string $statusText
 */
class EventsParticipants extends \yii\db\ActiveRecord
{

    const STATUS_JOIN = 1;
    const STATUS_CONFIRM = 2;
    const STATUS_CANCEL = 3;

    public $userModel ='';
    public function __construct(array $config = [])
    {
        $this->userModel = empty($this->userModel) ? Yii::$app->controller->userModel : $this->userModel;
        parent::__construct($config);
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'chabibnr_events_participants';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'events_id', 'date_register'], 'required'],
            [['user_id', 'events_id', 'date_register', 'date_confirm', 'status'], 'integer'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => $this->userModel, 'targetAttribute' => ['user_id' => 'id']],
            [['events_id'], 'exist', 'skipOnError' => true, 'targetClass' => Events::className(), 'targetAttribute' => ['events_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'events_id' => 'Events ID',
            'date_register' => 'Date Register',
            'date_confirm' => 'Date Confirm',
            'status' => 'Status',
        ];
    }

    public function getAllStatus(){
        return [
            static::STATUS_JOIN => 'Mengikuti',
            static::STATUS_CONFIRM => 'Konfirmasi',
            static::STATUS_CANCEL => 'Batal'
        ];
    }

    public function getStatusText(){
        $status = $this->getAllStatus();
        return isset($status[(int)$this->status]) ? $status[$this->status] : '';
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEvents()
    {
        return $this->hasOne(Events::className(), ['id' => 'events_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne($this->userModel, ['id' => 'user_id']);
    }
}

/**
 * End of File : EventsParcitipants.php
 *
 */