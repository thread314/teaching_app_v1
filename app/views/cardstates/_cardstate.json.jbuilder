json.extract! cardstate, :id, :user_id, :card_id, :delay, :due, :created_at, :updated_at
json.url cardstate_url(cardstate, format: :json)
