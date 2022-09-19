namespace :subscription do
  task subscription: :environment do
    sheet = Google::Spreadsheets.new
    val = sheet.get_values(ENV['SHEET_ID'], ['サブスクリプション!A2:G']).values
    Subscription.all.each do |f|
      f.destroy
    end
    val.each do |name, month_cost, importance, alternative|
      Subscription.create!(
        { name: name, month_cost: month_cost, importance: importance, alternative: alternative }
      )
    end
  end
end
