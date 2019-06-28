genres = %w(J-POP アジアンポップ ポップス ロック ハードロック・ヘヴィーメタル ブルース・カントリー ソウル・R&B ヒップホップ ダンス・エレクトロニカ ジャズ・フュージョン クラシック ワールド サウンドトラック ヒーリング・ニューエイジ アニメ・ゲーム)

genres.each do |genre|
  Genre.create(name: genre)
end

Faker::Config.locale = :ja

30.times do |index|
  Cd.create(
    title: Faker::Music.album,
    artist_name: Faker::Music.band,
    price: rand(1000..20000),
    description: Faker::Lorem.paragraph,
    genre_id: rand(1..10)
  )  
end