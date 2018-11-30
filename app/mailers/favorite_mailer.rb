class FavoriteMailer < ApplicationMailer

   

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@tranquil-fjord-15464.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@tranquil-fjord-15464.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@tranquil-fjord-15464.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    # #19
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
