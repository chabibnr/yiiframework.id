<?php
/**
 * Name : Chabib Nurozak
 * Email : chabibdev@gmail.com
 * Date: 8/13/17
 * Time: 10:15 AM
 * Version: 1.0
 * Website: https://chabibnr.net
 */

namespace chabibnr\events\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * EventsParticipantsSearch represents the model behind the search form about `chabibnr\events\models\EventsParticipants`.
 */
class EventsParticipantsSearch extends EventsParticipants
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'events_id', 'date_register', 'date_confirm', 'status'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = EventsParticipants::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'events_id' => $this->events_id,
            'date_register' => $this->date_register,
            'date_confirm' => $this->date_confirm,
            'status' => $this->status,
        ]);

        return $dataProvider;
    }
}

/**
 * End of File : EventsParticipantsSearch.php
 *
 */