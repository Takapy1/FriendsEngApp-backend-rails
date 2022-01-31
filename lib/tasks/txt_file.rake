namespace :txt_file do
  full_path = Rails.root.to_s + "/public/transcripts"

  desc "セリフをインスタンスに変換"
  task change_to_instance: :environment do
    (1..1).each do |season| # とりあえず１シーズンのみ作成（メモリの問題がありそう）
      txt_file_names = Dir.open(full_path + "/txt/season#{season}/").children
      episodes = Season.find(season).episodes

      txt_file_names.each do |txt_file_name|
        File.open(full_path + "/txt/season#{season}/" + txt_file_name, "r") do |f|
          episode_id = File.basename(f, ".*")[-2..-1].to_i
          episode_obj = episodes.find(episode_id + Constants::CUL_SUM_NUM_EPISODES_LIST[season-1]) # ~シーズンの中のepisode_id番目のインスタンスを見つける

          f.each_line.with_index do |line, i|
            txt_line = line.chomp
            Line.create!(content: txt_line, episode_id: episode_obj.id)
          end
        end
      end
    end
  end
end
