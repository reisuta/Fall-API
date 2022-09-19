json.records do
  json.array!(@aims_month) do |aim|
    json.extract! aim, *%i[
      id
      title
      reason
      advantage
      genre
      difficulty
      started_at
      ended_at
      category_ids
      created_at
      updated_at
    ]
  end
end
