<?php

namespace chabibnr\events\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "chabibnr_events".
 *
 * @property integer $id
 * @property string $slug
 * @property string $title
 * @property string $description
 * @property integer $date_start
 * @property integer $date_end
 * @property integer $max_participant
 * @property integer $status
 * @property string $location
 * @property string $city
 * @property string $address
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property array $allStatus
 * @property string $statusText
 *
 * @property EventsSpeakers[] $speakers
 */
class  Events extends \yii\db\ActiveRecord
{
    const STATUS_OPEN = 1;
    const STATUS_CLOSE = 2;
    const STATUS_END = 3;
    const STATUS_ONGOING = 4;
    const STATUS_CONFIRM = 5;

    public $userModel ='';

    public function __construct(array $config = [])
    {
        $this->userModel = empty($config['userModel']) ? Yii::$app->controller->userModel : $config['userModel'];
        parent::__construct($config);
    }

    public function behaviors()
    {
        return [
            BlameableBehavior::className(),
            [
                'class' => SluggableBehavior::className(),
                'attribute' => 'title',
                'slugAttribute' => 'slug',
                'immutable' => true
            ],
            TimestampBehavior::className(),
        ];
    }

    public function beforeSave($insert)
    {
        $this->date_start = date('U', strtotime($this->date_start));
        $this->date_end = date('U', strtotime($this->date_end));
        return parent::beforeSave($insert);
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'chabibnr_events';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description', 'date_start', 'location', 'address', 'date_end', 'city','max_participant'], 'required'],
            [['description', 'address','date_start','date_end'], 'string'],
            [['created_at', 'updated_at', 'created_by', 'updated_by','max_participant','status'], 'integer'],
            [['slug', 'title', 'location'], 'string', 'max' => 255],
            [['city'], 'string', 'max' => 100],
            [['slug'], 'unique'],
            [['created_by'], 'exist', 'skipOnError' => true, 'targetClass' => $this->userModel, 'targetAttribute' => ['created_by' => 'id']],
            [['updated_by'], 'exist', 'skipOnError' => true, 'targetClass' => $this->userModel, 'targetAttribute' => ['updated_by' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'slug' => 'Slug',
            'title' => 'Title',
            'description' => 'Description',
            'date_start' => 'Date Start',
            'location' => 'Location',
            'address' => 'Address',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'date_end' => 'Date End',
            'city' => 'City',
            'max_participant' => 'Max. Peserta',
            'status' => 'Status'
        ];
    }

    public function getAllStatus(){
        return [
            static::STATUS_OPEN => 'Buka',
            static::STATUS_CONFIRM => 'Konfirmasi',
            static::STATUS_CLOSE => 'Tutup',
            static::STATUS_ONGOING => 'Berlangsung',
            static::STATUS_END => 'Selesai',
        ];
    }

    public function getStatusText(){
        $status = $this->getAllStatus();
        return isset($status[(int)$this->status]) ? $status[$this->status] : '';
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne($this->userModel, ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne($this->userModel, ['id' => 'updated_by']);
    }

    public function getSpeakers(){
        return $this->hasMany(EventsSpeakers::className(),['events_id' => 'id']);
    }
}
