# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline


Admin.create!(
  [
    {email: 'Admin63446@example.com', password: 'Admin6843'}
  ]
)

end_users = EndUser.create!(
  [
    {email: 'kinako@test.com', password: 'k1n4k056HG', display_name: 'きなこ', first_name: '池内', last_name: '愛海', first_kana: 'イケウチ', last_kana: 'マナミ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'marumaru@test.com', password: 'm4Ru29ga7', display_name: '丸', first_name: '大崎', last_name: '桃果', first_kana: 'オオサキ', last_kana: 'モモカ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'hikozou@test.com', password: 'hI2k0z0U', display_name: 'ヒコゾー', first_name: '橘', last_name: '仁一', first_kana: 'タチバナ', last_kana: 'ジンイチ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'potita@test.com', password: 'POtiita1d782', display_name: 'ぽち太', first_name: '水田', last_name: '陽生', first_kana: 'ミズタ', last_kana: 'ハルキ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'pepochanmama@test.com', password: 'HGcm42YG1', display_name: 'ぺぽまま', first_name: '宮島', last_name: '里沙', first_kana: 'ミヤジマ', last_kana: 'リサ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'pipi43631@test.com', password: 'PipIt1bah8D5', display_name: 'ピピ', first_name: '須藤', last_name: '優風', first_kana: 'スドウ', last_kana: 'ユウ', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: 'sunflower@test.com', password: 'himawari15Get',display_name: 'ひまわり', first_name: '古賀', last_name: '花蓮', first_kana: 'コガ', last_kana: 'カレン', is_deleted: 'false', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")}
  ]
)

posts = Post.create!(
  [
    {
      end_user_id:  end_users[0].id,body: "はじめまして！あまり使い方がわかっていないですがよろしくお願いします！",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-post1.jpg"),filename:"sample-user1-post1.jpg")},
    {end_user_id:  end_users[1].id, body: "かわいい♡", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-post1.jpg"), filename:"sample-user2-post1.jpg")},
    {end_user_id:  end_users[2].id, body: "どうぞよろしくお願いします！　動物好きな方とつながりたいですー", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {end_user_id:  end_users[3].id, body: "よろしくです。",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.pg")},
    {end_user_id:  end_users[4].id, body: "投稿されているみなさんのペットかわいいくてうちの子も共有したくなりました！", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post1.jpg"), filename:"sample-user5-post1.jpg")},

    {end_user_id:  end_users[6].id, body: "かわいい子達ばかりでペットほしくなってきた（泣",},
    {end_user_id:  end_users[4].id, body: "寝てるところもかわいい！！",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post2.jpg"), filename:"sample-user5-post2.jpg")},
    {end_user_id:  end_users[0].id, body: "なにか狙ってるww", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-post2.jpg"), filename:"sample-user1-post2.jpg")},
    {end_user_id:  end_users[6].id, body: "猫ちゃんお迎えしようかな"},
    {end_user_id:  end_users[1].id, body: "丸のご飯かわなきゃ（汗"},

    {end_user_id:  end_users[5].id, body: "初めまして　これからよろしくお願いしますmm"},
    {end_user_id:  end_users[5].id, body: "うちの子のお迎え当時の写真です",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {end_user_id:  end_users[4].id, body: "ここから出てこないww", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post3.jpg"), filename:"sample-user5-post3.jpg")},
    {end_user_id:  end_users[6].id, body: "ぺぽままさんの猫ちゃんかわいすぎる！！"},
    {end_user_id:  end_users[4].id, body: "ここもお気に入りみたいww", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-post4.jpg"), filename:"sample-user5-post4.jpg")}
  ]
)

comments = Comment.create!(
  [
    {end_user_id:  end_users[1].id, post_id: posts[0].id, body: "はじめまして！ 猫ちゃんかわいいですね！！"},
    {end_user_id:  end_users[4].id, post_id: posts[0].id, body: "よろしくお願いします！ かわいくて反応しちゃいました！"},
    {end_user_id:  end_users[6].id, post_id: posts[0].id, body: "かわいいー♡　よろしくです！"},

    {end_user_id:  end_users[0].id, post_id: posts[1].id, body: "丸ちゃんwww"},

    {end_user_id:  end_users[0].id, post_id: posts[2].id, body: "ハリネズミ！！　かわいいですね"},

    {end_user_id:  end_users[1].id, post_id: posts[3].id, body: "よろしくお願いしますー　シェパードですか？？"},

    {end_user_id:  end_users[0].id, post_id: posts[4].id, body: "ぺぽちゃんひょっこりはんしてるwww"},
    {end_user_id:  end_users[6].id, post_id: posts[4].id, body: "ひょっこり♡"},

    {end_user_id:  end_users[0].id, post_id: posts[5].id, body: "大変だけどすごく癒されるよー"},
    {end_user_id:  end_users[4].id, post_id: posts[5].id, body: "泣泣"},

    {end_user_id:  end_users[0].id, post_id: posts[6].id, body: "気持ちよさそうにねてる♡"},
    {end_user_id:  end_users[6].id, post_id: posts[6].id, body: "撫でたくなるー"},

    {end_user_id:  end_users[4].id, post_id: posts[7].id, body: "きなこちゃん　ご飯かな？？ww"},
    {end_user_id:  end_users[6].id, post_id: posts[7].id, body: "www"},

    {end_user_id:  end_users[0].id, post_id: posts[9].id, body: "丸ちゃんは食べ盛りなのかな？？"},
    {end_user_id:  end_users[3].id, post_id: posts[9].id, body: "うちも買わなきゃです！！"},

    {end_user_id:  end_users[0].id, post_id: posts[11].id, body: "うさちゃんだ♡"},
    {end_user_id:  end_users[1].id, post_id: posts[11].id, body: "小さいー♡"},
    {end_user_id:  end_users[4].id, post_id: posts[11].id, body: "かわいいー♡"},
    {end_user_id:  end_users[6].id, post_id: posts[11].id, body: "手のひらサイズ♡♡"},

    {end_user_id:  end_users[0].id, post_id: posts[12].id, body: "そこがお気に入りなのかな？　うちの子もお気に入りの場所からでてこないことあるwww"},

    {end_user_id:  end_users[4].id, post_id: posts[13].id, body: "ありがとー♡♡　これからもたくさんかわいい写真あげるー"},

    {end_user_id:  end_users[0].id, post_id: posts[14].id, body: "お気に入りがたくさんww"},
    {end_user_id:  end_users[6].id, post_id: posts[14].id, body: "♡♡♡"}
  ]
)

replies = Reply.create!(
  [
    {end_user_id:  end_users[0].id, comment_id: comments[0].id, body: "はじめましてー！！ きなこっていいますー"},
    {end_user_id:  end_users[0].id, comment_id: comments[1].id, body: "はじめましてー！　ありがとうございます！　とっても嬉しいです！！"},
    {end_user_id:  end_users[0].id, comment_id: comments[2].id, body: "はじめましてー！ うれしいー♡"},

    {end_user_id:  end_users[1].id, comment_id: comments[3].id, body: "www"},

    {end_user_id:  end_users[2].id, comment_id: comments[4].id, body: "ありがとうございます！　ヒコゾーっていいますー！"},

    {end_user_id:  end_users[3].id, comment_id: comments[5].id, body: "そうですー！"},

    {end_user_id:  end_users[6].id, comment_id: comments[8].id, body: "仕事頑張って癒されたいです(泣"},

    {end_user_id:  end_users[1].id, comment_id: comments[14].id, body: "めちゃくちゃ食べるんですよww"},
    {end_user_id:  end_users[1].id, comment_id: comments[15].id, body: "ポチ太君たくさんたべそう！！"},

    {end_user_id:  end_users[5].id, comment_id: comments[16].id, body: "はじめまして！　ピピっていいます！"},
    {end_user_id:  end_users[5].id, comment_id: comments[17].id, body: "当時小さすぎて迷子にならないか心配でした"},
    {end_user_id:  end_users[5].id, comment_id: comments[18].id, body: "ありがとうございます！　ピピっていいます！"},
    {end_user_id:  end_users[5].id, comment_id: comments[19].id, body: "小さいですよねww"},

    {end_user_id:  end_users[4].id, comment_id: comments[20].id, body: "ここ好きみたいww"}
  ]
)

Like.create!(
  [
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[1].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[2].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[4].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[5].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[6].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[7].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[8].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[9].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[11].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[12].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[13].id},
    {end_user_id:  end_users[0].id, table_type: "Post", table_id: posts[14].id},

    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[0].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[1].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[2].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[7].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[11].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[12].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[13].id},
    {end_user_id:  end_users[0].id, table_type: "Comment", table_id: comments[21].id},

    {end_user_id:  end_users[0].id, table_type: "Reply", table_id: replies[3].id},
    {end_user_id:  end_users[0].id, table_type: "Reply", table_id: replies[4].id},
    {end_user_id:  end_users[0].id, table_type: "Reply", table_id: replies[6].id},
    {end_user_id:  end_users[0].id, table_type: "Reply", table_id: replies[7].id},
    {end_user_id:  end_users[0].id, table_type: "Reply", table_id: replies[9].id},
    {end_user_id:  end_users[0].id, table_type: "Reply", table_id: replies[13].id},

    {end_user_id:  end_users[1].id, table_type: "Post", table_id: posts[0].id},
    {end_user_id:  end_users[1].id, table_type: "Post", table_id: posts[3].id},
    {end_user_id:  end_users[1].id, table_type: "Post", table_id: posts[11].id},

    {end_user_id:  end_users[1].id, table_type: "Comment", table_id: comments[3].id},
    {end_user_id:  end_users[1].id, table_type: "Comment", table_id: comments[14].id},
    {end_user_id:  end_users[1].id, table_type: "Comment", table_id: comments[15].id},

    {end_user_id:  end_users[1].id, table_type: "Reply", table_id: replies[0].id},
    {end_user_id:  end_users[1].id, table_type: "Reply", table_id: replies[5].id},
    {end_user_id:  end_users[1].id, table_type: "Reply", table_id: replies[10].id},

    {end_user_id:  end_users[2].id, table_type: "Post", table_id: posts[0].id},
    {end_user_id:  end_users[2].id, table_type: "Post", table_id: posts[1].id},
    {end_user_id:  end_users[2].id, table_type: "Post", table_id: posts[3].id},
    {end_user_id:  end_users[2].id, table_type: "Post", table_id: posts[4].id},
    {end_user_id:  end_users[2].id, table_type: "Post", table_id: posts[5].id},
    {end_user_id:  end_users[2].id, table_type: "Post", table_id: posts[11].id},

    {end_user_id:  end_users[2].id, table_type: "Comment", table_id: comments[4].id},

    {end_user_id:  end_users[3].id, table_type: "Post", table_id: posts[1].id},
    {end_user_id:  end_users[3].id, table_type: "Post", table_id: posts[7].id},
    {end_user_id:  end_users[3].id, table_type: "Post", table_id: posts[9].id},
    {end_user_id:  end_users[3].id, table_type: "Post", table_id: posts[11].id},

    {end_user_id:  end_users[3].id, table_type: "Comment", table_id: comments[5].id},

    {end_user_id:  end_users[3].id, table_type: "Reply", table_id: replies[9].id},

    {end_user_id:  end_users[4].id, table_type: "Post", table_id: posts[0].id},
    {end_user_id:  end_users[4].id, table_type: "Post", table_id: posts[5].id},
    {end_user_id:  end_users[4].id, table_type: "Post", table_id: posts[7].id},
    {end_user_id:  end_users[4].id, table_type: "Post", table_id: posts[8].id},
    {end_user_id:  end_users[4].id, table_type: "Post", table_id: posts[11].id},
    {end_user_id:  end_users[4].id, table_type: "Post", table_id: posts[13].id},

    {end_user_id:  end_users[4].id, table_type: "Comment", table_id: comments[20].id},
    {end_user_id:  end_users[4].id, table_type: "Comment", table_id: comments[22].id},
    {end_user_id:  end_users[4].id, table_type: "Comment", table_id: comments[23].id},

    {end_user_id:  end_users[4].id, table_type: "Reply", table_id: replies[1].id},
    {end_user_id:  end_users[4].id, table_type: "Reply", table_id: replies[6].id},
    {end_user_id:  end_users[4].id, table_type: "Reply", table_id: replies[11].id},

    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[0].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[1].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[2].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[3].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[4].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[5].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[6].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[7].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[8].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[9].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[12].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[13].id},
    {end_user_id:  end_users[5].id, table_type: "Post", table_id: posts[14].id},

    {end_user_id:  end_users[5].id, table_type: "Comment", table_id: comments[16].id},
    {end_user_id:  end_users[5].id, table_type: "Comment", table_id: comments[17].id},
    {end_user_id:  end_users[5].id, table_type: "Comment", table_id: comments[18].id},
    {end_user_id:  end_users[5].id, table_type: "Comment", table_id: comments[19].id},

    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[0].id},
    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[4].id},
    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[6].id},
    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[7].id},
    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[11].id},
    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[12].id},
    {end_user_id:  end_users[6].id, table_type: "Post", table_id: posts[14].id},

    {end_user_id:  end_users[6].id, table_type: "Comment", table_id: comments[8].id},
    {end_user_id:  end_users[6].id, table_type: "Comment", table_id: comments[9].id},
    {end_user_id:  end_users[6].id, table_type: "Comment", table_id: comments[19].id},
    {end_user_id:  end_users[6].id, table_type: "Comment", table_id: comments[21].id},

    {end_user_id:  end_users[6].id, table_type: "Reply", table_id: replies[2].id},
    {end_user_id:  end_users[6].id, table_type: "Reply", table_id: replies[12].id}

  ]
)

FollowFollower.create!(
  [
    {followed_id:  end_users[0].id, follower_id: end_users[1].id},
    {followed_id:  end_users[0].id, follower_id: end_users[2].id},
    {followed_id:  end_users[0].id, follower_id: end_users[4].id},
    {followed_id:  end_users[0].id, follower_id: end_users[5].id},
    {followed_id:  end_users[0].id, follower_id: end_users[6].id},

    {followed_id:  end_users[1].id, follower_id: end_users[0].id},
    {followed_id:  end_users[1].id, follower_id: end_users[3].id},
    {followed_id:  end_users[1].id, follower_id: end_users[5].id},

    {followed_id:  end_users[2].id, follower_id: end_users[0].id},
    {followed_id:  end_users[2].id, follower_id: end_users[1].id},
    {followed_id:  end_users[2].id, follower_id: end_users[2].id},
    {followed_id:  end_users[2].id, follower_id: end_users[3].id},
    {followed_id:  end_users[2].id, follower_id: end_users[4].id},
    {followed_id:  end_users[2].id, follower_id: end_users[5].id},
    {followed_id:  end_users[2].id, follower_id: end_users[6].id},

    {followed_id:  end_users[3].id, follower_id: end_users[1].id},

    {followed_id:  end_users[4].id, follower_id: end_users[0].id},
    {followed_id:  end_users[4].id, follower_id: end_users[5].id},
    {followed_id:  end_users[4].id, follower_id: end_users[6].id},

    {followed_id:  end_users[5].id, follower_id: end_users[0].id},
    {followed_id:  end_users[5].id, follower_id: end_users[1].id},
    {followed_id:  end_users[5].id, follower_id: end_users[2].id},
    {followed_id:  end_users[5].id, follower_id: end_users[4].id},
    {followed_id:  end_users[5].id, follower_id: end_users[6].id},

    {followed_id:  end_users[6].id, follower_id: end_users[0].id},
    {followed_id:  end_users[6].id, follower_id: end_users[4].id}
  ]
)