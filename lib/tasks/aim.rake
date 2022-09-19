namespace :aim do
  task aim: :environment do
    sheet = Google::Spreadsheets.new
    val = sheet.get_values(ENV['SHEET_ID'], ['目標!A2:G']).values
    Aim.all.each do |f|
      f.destroy
    end
    val.each do |title, reason, advantage, genre, difficulty, started_at, ended_at|
      # if started_at.slice(5..6) < Time.now.strftime('%m') && ended_at
      #   next
      # end

      Aim.create!(
        { title: title, reason: reason, advantage: advantage, genre: genre, difficulty: difficulty, started_at: started_at,
ended_at: ended_at }
      )
    end
  end
end
