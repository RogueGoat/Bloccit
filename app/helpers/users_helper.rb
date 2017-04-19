module UsersHelper
    def no_post_or_comment?(posts, comments)
     current_user.posts.count == 0 && current_user.comments.count == 0
    end
end
