namespace :line_push do
  desc "LINEBOT：タスクの通知" 
  task :push_line_message_task => :environment do
      client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }

      limit_tasks =Tweet.where(time: Date.today)
      limit_tasks.each do |t|
          message = {
              type: 'text',
              text: "「#{t.body}」の期限は今日まです！"
          }
          response = client.push_message(t.user_uid, message)
          p response
      end
  end
end
