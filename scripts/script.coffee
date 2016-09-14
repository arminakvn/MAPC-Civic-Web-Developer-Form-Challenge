validationRules = fields:
  first_name:
    identifier: 'first_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter your first name'
    } ]
  last_name:
    identifier: 'last_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter your last name'
    } ]
  project_name:
    identifier: 'project_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter a project name'
    } ]
  organization_name:
    identifier: 'organization_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter a  name'
    } ]
  email:
    identifier: 'email'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter a email'
    } ]
  password:
    identifier: 'password'
    rules: [
      {
        type: 'empty'
        prompt: 'Please enter a password'
      }
      {
        type: 'minLength[6]'
        prompt: 'Your password must be at least {ruleValue} characters'
      }
    ]
$('.ui.form').form validationRules,
  inline: true
  on: 'blur'
  transition: 'fade down'

$('.ui.form .submit.button').api(
  method: 'GET'
  serializeForm: true
  data: $('.ui.form').form('get values')
  beforeSend: (settings) =>
    $('.ui.form').submit (e) ->
      false
    $form = $('.ui.form')
    email = $form.form('get value', 'email')
    console.log "email",email ,$form
    # if $(".ui.form").form('is valid')[1] is true
    settings.url = "/forminputemail/#{email}"
    return settings
    # else
    #   settings.url = "/"
    #   return settings
  onSuccess: (data) ->
    console.log "data", data
    valid = $(".ui.form").form('is valid')
    console.log "valid", valid
    $('.ui.form').submit (e) ->
      true
    if data.status == 0 and valid is true
       $('#signinprompt').modal('setting', 'transition', 'fade').modal('show')
    else if data.status == 1 and valid is true
      # window.location.pathname = "confirm/confirm.html"
        $('#confirmationpage').modal('setting', 'transition', 'fade').modal('show')
  )
