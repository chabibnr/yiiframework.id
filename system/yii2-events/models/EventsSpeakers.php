<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/15/17
 * Time: 9:19 PM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\models;
use Yii;

/**
 * This is the model class for table "chabibnr_events_speakers".
 *
 * @property integer $id
 * @property integer $events_id
 * @property string $name
 * @property string $photo
 * @property string $description
 *
 * @property Events $events
 */
class EventsSpeakers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'chabibnr_events_speakers';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['events_id', 'name', 'photo', 'description'], 'required'],
            [['events_id'], 'integer'],
            [['description'], 'string'],
            [['name', 'photo'], 'string', 'max' => 255],
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
            'events_id' => 'Events ID',
            'name' => 'Name',
            'photo' => 'Photo',
            'description' => 'Description',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEvents()
    {
        return $this->hasOne(Events::className(), ['id' => 'events_id']);
    }
}

/**
 * End of File : EventsSpeakers.php
 *
 */