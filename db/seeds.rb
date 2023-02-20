# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  [
    {email: 'Admin63446@example.com', password: 'Admin6843'}
  ]
)

EndUser.create!(
  [
    {email: 'kinako@test.com', password: 'k1n4k056HG', display_name: 'きなこ', first_name: '池内', last_name: '愛海', first_kane: 'イケウチ', last_kana: 'マナミ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'marumaru@test.com', password: 'm4Ru29ga7', display_name: '丸', first_name: '大崎', last_name: '桃果', first_kane: 'オオサキ', last_kana: 'モモカ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'hikozou@test.com', password: 'hI2k0z0U', display_name: 'ヒコゾー', first_name: '橘', last_name: '仁一', first_kane: 'タチバナ', last_kana: 'ジンイチ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'potita@test.com', password: 'POtiita1d782', display_name: 'ぽち太', first_name: '水田', last_name: '陽生', first_kane: 'ミズタ', last_kana: 'ハルキ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'pepochanmama@test.com', password: 'HGcm42YG1', display_name: 'ぺぽまま', first_name: '宮島', last_name: '里沙', first_kane: 'ミヤジマ', last_kana: 'リサ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'pipi43631@test.com', password: 'PipIt1bah8D5', display_name: 'ピピ', first_name: '須藤', last_name: '優風', first_kane: 'スドウ', last_kana: 'ユウ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: 'sunflower@test.com', password: 'himawari15Get',display_name: 'ひまわり', first_name: '古賀', last_name: '花蓮', first_kane: 'コガ', last_kana: 'カレン', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")}
  ]
)

Post.create!(
  [
    {end_user_id:  users[0].id, body: "はじめまして！あまり使い方がわかっていないですがよろしくお願いします！",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-post1.jpg"), filename:"sample-user1-post1.jpg")},
    {end_user_id:  users[1].id, body: "かわいい♡", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-post1.jpg"), filename:"sample-user2-post1.jpg")},
    {end_user_id:  users[2].id, body: "どうぞよろしくお願いします！　動物好きな方とつながりたいですー", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {end_user_id:  users[3].id, body: "よろしくです。",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.pg")},
    {end_user_id:  users[4].id, body: "投稿されているみなさんのペットかわいいくてうちの子も共有したくなりました！", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post1.jpg"), filename:"sample-user5-post1.jpg")},
    
    {end_user_id:  users[6].id, body: "かわいい子達ばかりでペットほしくなってきた（泣",},
    {end_user_id:  users[4].id, body: "寝てるところもかわいい！！",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post2.jpg"), filename:"sample-user5-post2.jpg")},
    {end_user_id:  users[0].id, body: "なにか狙ってるww", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-post2.jpg"), filename:"sample-user1-post2.jpg")},
    {end_user_id:  users[6].id, body: "猫ちゃんお迎えしようかな"},
    {end_user_id:  users[1].id, body: "丸のご飯かわなきゃ（汗"},
    
    {end_user_id:  users[5].id, body: "初めまして　これからよろしくお願いしますmm"},
    {end_user_id:  users[5].id, body: "うちの子のお迎え当時の写真です",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user6.jpg")},
    {end_user_id:  users[4].id, body: "ここから出てこないww", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post3.jpg"), filename:"sample-user2.jpg")},
    {end_user_id:  users[6].id, body: "ぺぽままさんの猫ちゃんかわいすぎる！！"},
    {end_user_id:  users[4].id, body: "ここもお気に入りみたいww", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post4.jpg"), filename:"sample-user5-post4.jpg")}
  ]
)

Comment.create!(
  [
    {end_user_id:  users[1].id, post_id: posts[0], body: "はじめまして！ 猫ちゃんかわいいですね！！"},
    {end_user_id:  users[4].id, post_id: posts[0], body: "よろしくお願いします！ かわいくて反応しちゃいました！"},
    {end_user_id:  users[6].id, post_id: posts[0], body: "かわいいー♡　よろしくです！"},
    
    {end_user_id:  users[0].id, post_id: posts[1], body: "丸ちゃんwww"},  
    
    {end_user_id:  users[0].id, post_id: posts[2], body: "ハリネズミ！！　かわいいですね"},
    
    {end_user_id:  users[1].id, post_id: posts[3], body: "よろしくお願いしますー　シェパードですか？？"},
    
    {end_user_id:  users[0].id, post_id: posts[4], body: "ぺぽちゃんひょっこりはんしてるwww"},
    {end_user_id:  users[6].id, post_id: posts[4], body: "ひょっこり♡"},
   
    {end_user_id:  users[0].id, post_id: posts[5], body: "大変だけどすごく癒されるよー"},
    {end_user_id:  users[4].id, post_id: posts[5], body: "泣泣"},
   
    
    {end_user_id:  users[0].id, post_id: posts[6], body: "気持ちよさそうにねてる♡"},
    {end_user_id:  users[6].id, post_id: posts[6], body: "撫でたくなるー"},
    
    {end_user_id:  users[4].id, post_id: posts[7], body: "きなこちゃん　ご飯かな？？ww"},
    {end_user_id:  users[6].id, post_id: posts[7], body: "www"},
    
    {end_user_id:  users[0].id, post_id: posts[9], body: "丸ちゃんは食べ盛りなのかな？？"}, 
    {end_user_id:  users[3].id, post_id: posts[9], body: "うちも買わなきゃです！！"},
    
    {end_user_id:  users[0].id, post_id: posts[11], body: "うさちゃんだ♡"}, 
    {end_user_id:  users[1].id, post_id: posts[11], body: "小さいー♡"},
    {end_user_id:  users[4].id, post_id: posts[11], body: "かわいいー♡"},
    {end_user_id:  users[6].id, post_id: posts[11], body: "手のひらサイズ♡♡"},
   
    {end_user_id:  users[0].id, post_id: posts[12], body: "そこがお気に入りなのかな？　うちの子もこのお気に入りの場所かでてこないことあるwww"},
    
    {end_user_id:  users[4].id, post_id: posts[13], body: "ありがとー♡♡　これからもたくさんかわいい写真あげるー"},
    
    {end_user_id:  users[0].id, post_id: posts[14], body: "お気に入りがたくさんww"},
    {end_user_id:  users[0].id, post_id: posts[14], body: "♡♡♡"}
  ]
)

Reply.create!(
  [
    {end_user_id:  users[0].id, comment_id: comments[0], body: "はじめましてー！！ きなこっていいますー"},
    {end_user_id:  users[0].id, comment_id: comments[1], body: "はじめましてー！　ありがとうございます！　とっても嬉しいです！！"},
    {end_user_id:  users[0].id, comment_id: comments[2], body: "はじめましてー！ うれしいー♡"},
    
    {end_user_id:  users[1].id, comment_id: comments[3], body: "www"},
    
    {end_user_id:  users[2].id, comment_id: comments[4], body: "ありがとうございます！　ヒコゾーっていいますー！"},
    
    {end_user_id:  users[3].id, comment_id: comments[5], body: "そうですー！"},
    
    {end_user_id:  users[6].id, comment_id: comments[8], body: "仕事頑張って癒されたいです(泣"},
    
    {end_user_id:  users[1].id, comment_id: comments[14], body: "めちゃくちゃ食べるんですよww"},
    {end_user_id:  users[1].id, comment_id: comments[15], body: "ポチ太君たくさんたべそう！！"},
    
    {end_user_id:  users[5].id, comment_id: comments[16], body: "はじめまして！　ピピっていいます！"},
    {end_user_id:  users[1].id, comment_id: comments[17], body: "当時小さすぎて迷子にならないか心配でした"},
    {end_user_id:  users[1].id, comment_id: comments[18], body: "ありがとうございます！　ピピっていいます！"},
    {end_user_id:  users[1].id, comment_id: comments[19], body: "小さいですよねww"},
    
    {end_user_id:  users[4].id, comment_id: comments[20], body: "ここ好きみたいww"},
  ]
)