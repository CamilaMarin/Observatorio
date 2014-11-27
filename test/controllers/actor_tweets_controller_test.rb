require 'test_helper'

class ActorTweetsControllerTest < ActionController::TestCase
  setup do
    @actor_tweet = actor_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actor_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actor_tweet" do
    assert_difference('ActorTweet.count') do
      post :create, actor_tweet: { id_actor: @actor_tweet.id_actor, id_at: @actor_tweet.id_at, id_tweet: @actor_tweet.id_tweet }
    end

    assert_redirected_to actor_tweet_path(assigns(:actor_tweet))
  end

  test "should show actor_tweet" do
    get :show, id: @actor_tweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actor_tweet
    assert_response :success
  end

  test "should update actor_tweet" do
    patch :update, id: @actor_tweet, actor_tweet: { id_actor: @actor_tweet.id_actor, id_at: @actor_tweet.id_at, id_tweet: @actor_tweet.id_tweet }
    assert_redirected_to actor_tweet_path(assigns(:actor_tweet))
  end

  test "should destroy actor_tweet" do
    assert_difference('ActorTweet.count', -1) do
      delete :destroy, id: @actor_tweet
    end

    assert_redirected_to actor_tweets_path
  end
end
