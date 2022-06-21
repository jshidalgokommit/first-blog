# frozen_string_literal: true

module FollowersHelper

  # render a follow or unfollow btn for specific user
  def followers_btn(user)
    if user_signed_in? && current_user.id != user.id
      @@following = user.followed_by(current_user.id)
      if @@following.present?
        unfollow_btn
      else
        follow_btn(user)
      end
    end
  end

  private

  def follow_btn(user_to_follow)
    form_with model: Follower, method: :post do |form|
      res = form.hidden_field :followed_user_id, value: user_to_follow.id
      res += form.hidden_field :followed_by_user_id, value: current_user.id
      res += form.button '', class: 'btn badge bg-primary rounded-pill', title: 'Follow' do
        'Follow <i data-feather="user-plus"></i>'.html_safe
      end
      res
    end
  end

  def unfollow_btn
    form_with model: @@following, method: :delete do |form|
      form.button '', class: 'btn badge bg-danger rounded-pill', title: 'Unfollow' do
        'Unfollow <i data-feather="user-minus"></i>'.html_safe
      end
    end
  end
end
