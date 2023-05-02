class PostPdf <  Prawn::Document
  def initialize(post)
     super()
     text "Post #{post.id}"
     text "#{post.title}" , size: 30
     text "#{post.body}" , size: 20
     text "#{post.status}" , size: 20
     text "#{post.user_id}" , size: 20
     test
  end
  def test
    text "ttest"
  end
end 