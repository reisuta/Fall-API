json.records do
  json.array!(@subscriptions) do |subscription|
    json.extract! subscription, *%i[
      id
      name
      month_cost
      importance
      alternative
      created_at
      updated_at
    ]
  end
end

json.total @total
