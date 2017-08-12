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
 * @property integer $date
 * @property string $location
 * @property string $address
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property User $createdBy
 * @property User $updatedBy
 */
class Events extends \yii\db\ActiveRecord
{
    public $userModel ='';
    public function __construct(array $config = [])
    {
        $this->userModel = empty($this->userModel) ? Yii::$app->controller->module->userModel : $this->userModel;
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
        $this->date = date('U', strtotime($this->date));
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
            [['title', 'description', 'date', 'location', 'address'], 'required'],
            [['description', 'address'], 'string'],
            [['created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['slug', 'title', 'location'], 'string', 'max' => 255],
            [['slug'], 'unique'],
            [['date'], 'safe'],
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
            'date' => 'Date',
            'location' => 'Location',
            'address' => 'Address',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
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
}
