genres = %w(J-POP アジアンポップ ポップス ロック ハードロック・ヘヴィーメタル ブルース・カントリー ソウル・R&B ヒップホップ ダンス・エレクトロニカ ジャズ・フュージョン クラシック ワールド サウンドトラック ヒーリング・ニューエイジ アニメ・ゲーム)

genres.each do |genre|
  Genre.create(name: genre)
end