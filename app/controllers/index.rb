get '/' do
  erb :index
end


# TODO: convert this route to use AJAX
post '/rolls' do
  # If the user passes-in a "value", let's use it. Otherwise, we'll generate a random one.
  # See: roll_if_value_is_nil method in the Roll model.
  value = params[:value] ? params[:value].to_i : nil

  @roll = value ? Roll.create({ value: value }) : Roll.create

  if request.xhr? # XHR is the X in AJAX, so this is the AJAX call
    halt 200, {roll: @roll}.to_json
  else # this would serve browsers, you could also filter by content type… YMMV
    erb :index
  end
end
