json.extract! reservation, :id, :user_id, :event_id, :start_date, :end_date, :price, :total, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)