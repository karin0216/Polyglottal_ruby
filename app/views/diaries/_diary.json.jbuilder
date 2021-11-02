json.extract! diary, :id, :title, :feeling, :text, :created_at, :updated_at
json.url diary_url(diary, format: :json)
