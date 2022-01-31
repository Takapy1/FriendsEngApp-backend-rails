namespace :dir do
  TRANSCRIPTS_PATH = Rails.root.to_s + "/public/transcripts"

  desc "transcriptsディレクトリ作成"
  task create_transcripts: :environment do
    Dir.mkdir(TRANSCRIPTS_PATH)
  end

  desc "htmlディレクトリ作成"
  task create_html: [:create_transcripts] do
    Dir.mkdir(TRANSCRIPTS_PATH + "/html")
  end

  desc "htmlディレクトリに各seasonディレクトリ作成"
  task create_seasons_to_html: [:create_transcripts, :create_html] do 
    (1..10).each do |season|
      Dir.mkdir(TRANSCRIPTS_PATH + "/html/season#{season}")
    end
  end

  desc "txtディレクトリ作成"
  task create_txt: :environment do
    Dir.mkdir(TRANSCRIPTS_PATH + "/txt")
  end

  desc "txtディレクトリに各seasonディレクトリ作成"
  task create_seasons_to_txt: [:create_txt] do
    (1..10).each do |season|
      Dir.mkdir(TRANSCRIPTS_PATH + "/txt/season#{season}")
    end
  end
end
