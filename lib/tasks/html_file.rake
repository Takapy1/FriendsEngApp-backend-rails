namespace :html_file do
  desc "HTML fileのdialogueの部分をテキストファイルに変換する"
  task change_to_txt: :environment do
    full_path = Rails.root.to_s + "/public/transcripts"
    (1..10).each do |season|
      html_file_names = Dir.open(full_path + "/html/season#{season}").children
      html_file_names.each do |html_file_name|
        
        file = File.open(full_path + "/html/season#{season}/" + html_file_name, "r")
        html = file.read
        doc = Nokogiri::HTML.parse(html)
        p_elements = doc.css('p')

        base_name = File.basename(file, ".*")
        File.open(full_path + "/txt/season#{season}/" + base_name + ".txt", "w") do |f|
          p_elements.each do |p_element|
            f.puts(p_element.content)
          end
        end
      end
    end
  end
end
