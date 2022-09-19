json.records do
  json.extract! @subscription, *%i[
    id
    name
    month_cost
    importance
    alternative
    created_at
    updated_at
    ]
end
