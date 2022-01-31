module Constants
  # 1つのファイルに２つのエピソードあるものがあるので注意！
  NUM_EACH_EPISODE = { "1" => 24, "2" => 23, "3" => 25, "4" => 23, "5" => 23, "6" => 23, "7" => 24, "8" => 23, "9" => 23, "10" => 17 }
  # 累積和
  CUL_SUM_NUM_EPISODES_LIST = [0, 24, 47, 72, 95, 118, 141, 165, 188, 211, 228]

  # sum = 0
  # (1..10).each do |i|
  #   sum += Constants::NUM_EACH_EPISODE[i.to_s]
  #   a << sum
  # end
end
