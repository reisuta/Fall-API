json.records do
  json.array!(@todos) do |todo|
    json.extract! todo, *%i[
      id
      title
      status
      created_at
      updated_at
    ]
  end
end
