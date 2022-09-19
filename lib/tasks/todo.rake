namespace :todo do
  task todo: :environment do
    sheet = Google::Spreadsheets.new
    val = sheet.get_values(ENV['SHEET_ID'], ['TODO!A2:G']).values
    Todo.all.each do |f|
      f.destroy
    end
    val.each do |title, status|
      Todo.create!(
        { title: title, status: status }
      )
    end
  end
end
