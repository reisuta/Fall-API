json.records do
  json.array!(@books) do |book|
    json.extract! book, *%i[
      id
      title
      author
      amount
      is_library
      bought_at
      started_at
      ended_at
      created_at
      updated_at
    ]
  end
end
