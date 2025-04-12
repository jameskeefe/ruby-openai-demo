# gem install ruby-openai
# gem install dotenv
# gen install pry-byebug
require "openai"
require "dotenv/load"
require "pry-byebug"

# Write your solution here!
client = OpenAI::Client.new(access_token: ENV.fetch("GIRAFFE"))

# 50 dashes
dash = ''
50.times do
  dash += "-"
end

message_list = [
{
  "role" => "system",
  "content" => "You are a helpful assistant who talks like Shakespeare."
}
]

puts "Hello! How can I help you today?"
puts dash

user_input = ''
while user_input!='bye'
  
  user_input = gets.chomp()
  puts dash

  if user_input == 'bye'
    next
  else

    message_list.push({
      "role" => "user",
      "content" => user_input
    })
  
    # Call the API to get the next message from GPT
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )

    puts "Chat GPT output:" 
    gpt_output = api_response['choices'][0]['message']['content']
    puts gpt_output
    puts dash

    message_list.push(
      {
      "role" => "assistant",
      "content" => gpt_output
    })

  end
end

puts "Have a nice day."
